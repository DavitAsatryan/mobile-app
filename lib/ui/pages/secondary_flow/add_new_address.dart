import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/address/address_state.dart';
import 'package:cursus_app/store/dashboard/dashboard_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/rounded_text_input.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'package:google_maps_webservice/places.dart';

class AddNewAddressPage extends StatefulWidget {
  final int? id;
  final LatLng? latLng;
  final AddressState addressState;

  const AddNewAddressPage(
      {Key? key, this.id, this.latLng, required this.addressState})
      : super(key: key);

  @override
  _AddNewAddressPageState createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  late CameraPosition cameraPosition;

  final DashboardState dashboardState = GetIt.I<DashboardState>();
  TextEditingController entranceController = TextEditingController();
  List<Marker> markers = [];
  Completer<GoogleMapController> _controller = Completer();
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  Mode _mode = Mode.overlay;
  LatLng currentLatLng = LatLng(
      0.0, 0.0); //initial currentPosition values cannot assign null values

  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(
      target: widget.latLng ?? dashboardState.coordinates!,
      zoom: 15,
    );

    if (widget.latLng != null) {
      _handleTap(widget.latLng!);
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _currentLocation();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: CustomAppBar(
        title: 'addNewAddress'.tr(),
        toolBarHeight: 50,
      ),
      body: widget.addressState.storeState == StoreStates.loading
          ? Loading(
              color: Colors.transparent,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: _handlePressButton,
                    child: Text("searchPlaces".tr()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GoogleMap(
                    myLocationEnabled: true,
                    markers: markers.toSet(),
                    onMapCreated: (GoogleMapController controller) {
                      controller.setMapStyle(StringConst.MAP_STYLE);
                      _controller.complete(controller);
                    },
                    initialCameraPosition: CameraPosition(
                      target: cameraPosition.target,
                      zoom: 15,
                    ),
                    onTap: _handleTap,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedTextInput(
                    controller: entranceController,
                    inputType: TextInputType.text,
                    hintText: 'entranceNum',
                    obscureText: false,
                    onChanged: (value) {
                      {
                        widget.addressState.selectedAddress = widget
                            .addressState.selectedAddress
                            .copyWith(entrance: value);
                      }
                    },
                  ),
                ),
                MainButton(
                  callback: () async {
                    if (widget.id != null) {
                      await widget.addressState.deleteAddress(widget.id!);
                    }
                    await widget.addressState.createAddress();
                    await widget.addressState.getAddresses();
                    await AutoRouter.of(context).pop();
                  },
                  label: widget.id == null
                      ? 'addAddress'.tr()
                      : 'changeAddress'.tr(),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    await AutoRouter.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      'keywords.cancel',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ).tr(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
    );
  }

  // get current location
  Future<LatLng> getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        currentLatLng =
            new LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
    return currentLatLng;
  }

  //call this onPress floating action button
  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LatLng lat = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: lat,
        zoom: 18.0,
      ),
    ));
    _handleTap(lat);
  }

  _handleTap(LatLng point) {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId(point.toString()),
      position: point,
      infoWindow: InfoWindow(),
    ));

    moveCamera(point);
    widget.addressState.getAddressFromLatLng(point);
    setState(() {});
  }

  Future<void> moveCamera(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: position,
      zoom: 15,
    )));
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      types: [],
      apiKey: StringConst.mapKey,
      onError: onError,
      mode: _mode,
      strictbounds: false,
      language: "en",
      decoration: InputDecoration(
        hintText: 'keywords.search'.tr(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "am")],
    );

    displayPrediction(p!, homeScaffoldKey.currentState!);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: StringConst.mapKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    widget.addressState.selectedAddress = widget.addressState.selectedAddress
        .copyWith(
            latitude: lat,
            longitude: lng,
            address: detail.result.formattedAddress,
            isDefault: false,
            city: 'asd',
            country: 'asd',
            zipCode: 'asd');
    LatLng place = LatLng(lat, lng);
    _handleTap(place);
  }
}
