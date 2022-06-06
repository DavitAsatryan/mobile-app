import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/dashboard/dashboard_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/ui/widgets/buttons/main_button.dart';
import 'package:cursus_app/ui/widgets/custom_appbar.dart';
import 'package:cursus_app/ui/widgets/loading.dart';
import 'package:cursus_app/ui/widgets/text_input.dart';
import 'package:cursus_app/values/values.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  DashboardState dashboardState = GetIt.I<DashboardState>();
  late CameraPosition cameraPosition;
  Completer<GoogleMapController> _controller = Completer();
  final MarkerId markerId = MarkerId('2');
  List<Marker> markers = [];
  Marker? marker;

  @override
  void initState() {
    super.initState();
    getInfo();
    cameraPosition = CameraPosition(
      target: dashboardState.coordinates!,
      zoom: 15,
    );
    marker = Marker(markerId: markerId, position: dashboardState.coordinates!);
    markers.add(marker!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'keywords.about_us'.tr(), toolBarHeight: 50,),
      body: Observer(
        builder: (_) => dashboardState.storeStates.state == StoreStates.loading
            ? Center(
                child: Loading(
                  color: Colors.transparent,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                      child: GoogleMap(
                        markers: markers.toSet(),
                        initialCameraPosition: cameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          controller.setMapStyle(StringConst.MAP_STYLE);
                          _controller.complete(controller);
                        },
                      ),
                    ),
                    _DetailContainer(),
                    _GetInTouch(),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> getInfo() async {
    if (dashboardState.aboutUsModel == null) {
      await dashboardState.getAboutUs();
    }
  }
}

class _DetailContainer extends StatefulWidget {
  const _DetailContainer({Key? key}) : super(key: key);

  @override
  State<_DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<_DetailContainer> {
  DashboardState dashboardState = GetIt.I<DashboardState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      color: AppColors.purpleDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'contactUs'.tr(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Observer(
              builder: (_) => Text(
                dashboardState.aboutUsModel!.contactAddress,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Observer(
              builder: (_) => Text(
                dashboardState.aboutUsModel!.contactEmail,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
            Observer(
              builder: (_) => Text(
                dashboardState.aboutUsModel!.contactPhone,
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GetInTouch extends StatefulWidget {
  const _GetInTouch({Key? key}) : super(key: key);

  @override
  State<_GetInTouch> createState() => _GetInTouchState();
}

class _GetInTouchState extends State<_GetInTouch> {
  DashboardState dashboardState = GetIt.I<DashboardState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/illustrations/ill_back.png',
          fit: BoxFit.fitHeight,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'getInTouch'.tr(),
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: AppColors.purpleDark,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextInput(
                controller: nameController,
                textColor: AppColors.textDarkPurpleColor,
                hintText: 'hints.name'.tr(),
                hintColor: AppColors.darkBlackColor,
                padding: EdgeInsets.zero,
              ),
              SizedBox(
                height: 10,
              ),
              TextInput(
                controller: emailController,
                textColor: AppColors.textDarkPurpleColor,
                hintText: 'email'.tr(),
                hintColor: AppColors.darkBlackColor,
                padding: EdgeInsets.zero,
              ),
              SizedBox(
                height: 10,
              ),
              TextInput(
                controller: phoneController,
                textColor: AppColors.textDarkPurpleColor,
                hintText: 'hints.phoneNumber'.tr(),
                hintColor: AppColors.darkBlackColor,
                padding: EdgeInsets.zero,
              ),
              SizedBox(
                height: 10,
              ),
              TextInput(
                controller: messageController,
                textColor: AppColors.textDarkPurpleColor,
                hintText: 'message'.tr(),
                onChanged: (_) {
                  setState(() {});
                },
                hintColor: AppColors.darkBlackColor,
                padding: EdgeInsets.zero,
                minLines: 4,
                maxLines: 10,
              ),
              SizedBox(
                height: 50,
              ),
              MainButton(
                callback: messageController.text.isEmpty
                    ? null
                    : () async {
                        dashboardState.sendMessage(
                            context,
                            nameController.text,
                            phoneController.text,
                            emailController.text,
                            messageController.text);
                        clearControllers();
                        await AutoRouter.of(context).pop();
                      },
                label: 'sendMessage'.tr(),
                padding: EdgeInsets.zero,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => clearControllers(),
                child: Center(
                  child: Text(
                    'clear'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void clearControllers() {
    nameController.clear();
    phoneController.clear();
    messageController.clear();
    emailController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    messageController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
