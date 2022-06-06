// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i30;

import 'model/order/order_service_model.dart' as _i32;
import 'store/address/address_state.dart' as _i31;
import 'store/patients/patients_state.dart' as _i33;
import 'ui/pages/authentication/authorization_page.dart' as _i2;
import 'ui/pages/bundle/bundle_page.dart' as _i9;
import 'ui/pages/forgot_password/forgot_password.dart' as _i4;
import 'ui/pages/intro_page.dart' as _i1;
import 'ui/pages/main_navigation/dashbord_page.dart' as _i3;
import 'ui/pages/main_navigation/laboratory_screen.dart' as _i5;
import 'ui/pages/main_navigation/subcategory_page.dart' as _i6;
import 'ui/pages/order/new_order_page.dart' as _i7;
import 'ui/pages/payment/payment_page.dart' as _i27;
import 'ui/pages/secondary_flow/about_us_page.dart' as _i13;
import 'ui/pages/secondary_flow/add_new_address.dart' as _i16;
import 'ui/pages/secondary_flow/add_new_patient.dart' as _i18;
import 'ui/pages/secondary_flow/addresses_page.dart' as _i19;
import 'ui/pages/secondary_flow/bundle_details_page.dart' as _i25;
import 'ui/pages/secondary_flow/cards_page.dart' as _i11;
import 'ui/pages/secondary_flow/cart_page.dart' as _i22;
import 'ui/pages/secondary_flow/checkout_page.dart' as _i23;
import 'ui/pages/secondary_flow/help_page.dart' as _i14;
import 'ui/pages/secondary_flow/order_details.dart' as _i15;
import 'ui/pages/secondary_flow/order_service_details.dart' as _i17;
import 'ui/pages/secondary_flow/patients_page.dart' as _i20;
import 'ui/pages/secondary_flow/personal_data.dart' as _i12;
import 'ui/pages/secondary_flow/privacy_page.dart' as _i21;
import 'ui/pages/secondary_flow/settings_page.dart' as _i24;
import 'ui/pages/services/services_page.dart' as _i8;
import 'ui/pages/verify_account/verify_account.dart' as _i10;
import 'ui/pages/verify_account/verify_otp_code_slide.dart' as _i26;

class FlutterRouter extends _i28.RootStackRouter {
  FlutterRouter([_i29.GlobalKey<_i29.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    IntroRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.IntroPage());
    },
    AuthorizationRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthorizationPage());
    },
    DashboardRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ForgotPasswordPage());
    },
    LaboratoryRoute.name: (routeData) {
      final args = routeData.argsAs<LaboratoryRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.LaboratoryPage(
              key: args.key, subCategoryId: args.subCategoryId));
    },
    SubCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<SubCategoryRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i6.SubCategoryPage(categoryId: args.categoryId, key: args.key));
    },
    NewOrderRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NewOrderPage());
    },
    ServicesRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ServicesPage());
    },
    BundlesRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.BundlesPage());
    },
    VerifyAccountRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyAccountRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.VerifyAccountPage(
              phoneNumber: args.phoneNumber,
              userVerifyToken: args.userVerifyToken,
              key: args.key));
    },
    CardsRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.CardsPage());
    },
    PersonalDataRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.PersonalDataPage());
    },
    AboutRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.AboutPage());
    },
    HelpRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.HelpPage());
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.OrderDetailsPage(oderID: args.oderID, key: args.key));
    },
    AddNewAddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewAddressRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.AddNewAddressPage(
              key: args.key,
              id: args.id,
              latLng: args.latLng,
              addressState: args.addressState));
    },
    OrderServiceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderServiceDetailsRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.OrderServiceDetailsPage(
              orderServiceModel: args.orderServiceModel,
              currency: args.currency,
              key: args.key));
    },
    AddNewPatientRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewPatientRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.AddNewPatientPage(
              key: args.key, id: args.id, patientState: args.patientState));
    },
    AddressesRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.AddressesPage());
    },
    PatientsRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.PatientsPage());
    },
    PrivacyRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.PrivacyPage());
    },
    CartRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.CartPage());
    },
    CheckoutRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.CheckoutPage());
    },
    SettingsRoute.name: (routeData) {
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.SettingsPage());
    },
    BundleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BundleDetailsRouteArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i25.BundleDetailsPage(bundleId: args.bundleId, key: args.key));
    },
    VerifyOtpCodeSlide.name: (routeData) {
      final args = routeData.argsAs<VerifyOtpCodeSlideArgs>();
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i26.VerifyOtpCodeSlide(
              key: args.key,
              phoneNumber: args.phoneNumber,
              userVerifyToken: args.userVerifyToken));
    },
    ArcaPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<ArcaPaymentRouteArgs>(
          orElse: () => const ArcaPaymentRouteArgs());
      return _i28.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i27.ArcaPaymentPage(
              key: args.key,
              redirectUrl: args.redirectUrl,
              vendorOrderId: args.vendorOrderId));
    }
  };

  @override
  List<_i28.RouteConfig> get routes => [
        _i28.RouteConfig(IntroRoute.name, path: '/'),
        _i28.RouteConfig(AuthorizationRoute.name, path: '/authorization-page'),
        _i28.RouteConfig(DashboardRoute.name, path: '/dashboard-page'),
        _i28.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-page'),
        _i28.RouteConfig(LaboratoryRoute.name, path: '/laboratory-page'),
        _i28.RouteConfig(SubCategoryRoute.name, path: '/sub-category-page'),
        _i28.RouteConfig(NewOrderRoute.name, path: '/new-order-page'),
        _i28.RouteConfig(ServicesRoute.name, path: '/services-page'),
        _i28.RouteConfig(BundlesRoute.name, path: '/bundles-page'),
        _i28.RouteConfig(VerifyAccountRoute.name, path: '/verify-account-page'),
        _i28.RouteConfig(CardsRoute.name, path: '/cards-page'),
        _i28.RouteConfig(PersonalDataRoute.name, path: '/personal-data-page'),
        _i28.RouteConfig(AboutRoute.name, path: '/about-page'),
        _i28.RouteConfig(HelpRoute.name, path: '/help-page'),
        _i28.RouteConfig(OrderDetailsRoute.name, path: '/order-details-page'),
        _i28.RouteConfig(AddNewAddressRoute.name,
            path: '/add-new-address-page'),
        _i28.RouteConfig(OrderServiceDetailsRoute.name,
            path: '/order-service-details-page'),
        _i28.RouteConfig(AddNewPatientRoute.name,
            path: '/add-new-patient-page'),
        _i28.RouteConfig(AddressesRoute.name, path: '/addresses-page'),
        _i28.RouteConfig(PatientsRoute.name, path: '/patients-page'),
        _i28.RouteConfig(PrivacyRoute.name, path: '/privacy-page'),
        _i28.RouteConfig(CartRoute.name, path: '/cart-page'),
        _i28.RouteConfig(CheckoutRoute.name, path: '/checkout-page'),
        _i28.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i28.RouteConfig(BundleDetailsRoute.name, path: '/bundle-details-page'),
        _i28.RouteConfig(VerifyOtpCodeSlide.name,
            path: '/verify-otp-code-slide'),
        _i28.RouteConfig(ArcaPaymentRoute.name, path: '/arca-payment-page')
      ];
}

/// generated route for
/// [_i1.IntroPage]
class IntroRoute extends _i28.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/');

  static const String name = 'IntroRoute';
}

/// generated route for
/// [_i2.AuthorizationPage]
class AuthorizationRoute extends _i28.PageRouteInfo<void> {
  const AuthorizationRoute()
      : super(AuthorizationRoute.name, path: '/authorization-page');

  static const String name = 'AuthorizationRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i28.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/dashboard-page');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i28.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: '/forgot-password-page');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i5.LaboratoryPage]
class LaboratoryRoute extends _i28.PageRouteInfo<LaboratoryRouteArgs> {
  LaboratoryRoute({_i29.Key? key, required int subCategoryId})
      : super(LaboratoryRoute.name,
            path: '/laboratory-page',
            args: LaboratoryRouteArgs(key: key, subCategoryId: subCategoryId));

  static const String name = 'LaboratoryRoute';
}

class LaboratoryRouteArgs {
  const LaboratoryRouteArgs({this.key, required this.subCategoryId});

  final _i29.Key? key;

  final int subCategoryId;

  @override
  String toString() {
    return 'LaboratoryRouteArgs{key: $key, subCategoryId: $subCategoryId}';
  }
}

/// generated route for
/// [_i6.SubCategoryPage]
class SubCategoryRoute extends _i28.PageRouteInfo<SubCategoryRouteArgs> {
  SubCategoryRoute({required int categoryId, _i29.Key? key})
      : super(SubCategoryRoute.name,
            path: '/sub-category-page',
            args: SubCategoryRouteArgs(categoryId: categoryId, key: key));

  static const String name = 'SubCategoryRoute';
}

class SubCategoryRouteArgs {
  const SubCategoryRouteArgs({required this.categoryId, this.key});

  final int categoryId;

  final _i29.Key? key;

  @override
  String toString() {
    return 'SubCategoryRouteArgs{categoryId: $categoryId, key: $key}';
  }
}

/// generated route for
/// [_i7.NewOrderPage]
class NewOrderRoute extends _i28.PageRouteInfo<void> {
  const NewOrderRoute() : super(NewOrderRoute.name, path: '/new-order-page');

  static const String name = 'NewOrderRoute';
}

/// generated route for
/// [_i8.ServicesPage]
class ServicesRoute extends _i28.PageRouteInfo<void> {
  const ServicesRoute() : super(ServicesRoute.name, path: '/services-page');

  static const String name = 'ServicesRoute';
}

/// generated route for
/// [_i9.BundlesPage]
class BundlesRoute extends _i28.PageRouteInfo<void> {
  const BundlesRoute() : super(BundlesRoute.name, path: '/bundles-page');

  static const String name = 'BundlesRoute';
}

/// generated route for
/// [_i10.VerifyAccountPage]
class VerifyAccountRoute extends _i28.PageRouteInfo<VerifyAccountRouteArgs> {
  VerifyAccountRoute(
      {required String phoneNumber, String? userVerifyToken, _i29.Key? key})
      : super(VerifyAccountRoute.name,
            path: '/verify-account-page',
            args: VerifyAccountRouteArgs(
                phoneNumber: phoneNumber,
                userVerifyToken: userVerifyToken,
                key: key));

  static const String name = 'VerifyAccountRoute';
}

class VerifyAccountRouteArgs {
  const VerifyAccountRouteArgs(
      {required this.phoneNumber, this.userVerifyToken, this.key});

  final String phoneNumber;

  final String? userVerifyToken;

  final _i29.Key? key;

  @override
  String toString() {
    return 'VerifyAccountRouteArgs{phoneNumber: $phoneNumber, userVerifyToken: $userVerifyToken, key: $key}';
  }
}

/// generated route for
/// [_i11.CardsPage]
class CardsRoute extends _i28.PageRouteInfo<void> {
  const CardsRoute() : super(CardsRoute.name, path: '/cards-page');

  static const String name = 'CardsRoute';
}

/// generated route for
/// [_i12.PersonalDataPage]
class PersonalDataRoute extends _i28.PageRouteInfo<void> {
  const PersonalDataRoute()
      : super(PersonalDataRoute.name, path: '/personal-data-page');

  static const String name = 'PersonalDataRoute';
}

/// generated route for
/// [_i13.AboutPage]
class AboutRoute extends _i28.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/about-page');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i14.HelpPage]
class HelpRoute extends _i28.PageRouteInfo<void> {
  const HelpRoute() : super(HelpRoute.name, path: '/help-page');

  static const String name = 'HelpRoute';
}

/// generated route for
/// [_i15.OrderDetailsPage]
class OrderDetailsRoute extends _i28.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({required int oderID, _i29.Key? key})
      : super(OrderDetailsRoute.name,
            path: '/order-details-page',
            args: OrderDetailsRouteArgs(oderID: oderID, key: key));

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({required this.oderID, this.key});

  final int oderID;

  final _i29.Key? key;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{oderID: $oderID, key: $key}';
  }
}

/// generated route for
/// [_i16.AddNewAddressPage]
class AddNewAddressRoute extends _i28.PageRouteInfo<AddNewAddressRouteArgs> {
  AddNewAddressRoute(
      {_i29.Key? key,
      int? id,
      _i30.LatLng? latLng,
      required _i31.AddressState addressState})
      : super(AddNewAddressRoute.name,
            path: '/add-new-address-page',
            args: AddNewAddressRouteArgs(
                key: key, id: id, latLng: latLng, addressState: addressState));

  static const String name = 'AddNewAddressRoute';
}

class AddNewAddressRouteArgs {
  const AddNewAddressRouteArgs(
      {this.key, this.id, this.latLng, required this.addressState});

  final _i29.Key? key;

  final int? id;

  final _i30.LatLng? latLng;

  final _i31.AddressState addressState;

  @override
  String toString() {
    return 'AddNewAddressRouteArgs{key: $key, id: $id, latLng: $latLng, addressState: $addressState}';
  }
}

/// generated route for
/// [_i17.OrderServiceDetailsPage]
class OrderServiceDetailsRoute
    extends _i28.PageRouteInfo<OrderServiceDetailsRouteArgs> {
  OrderServiceDetailsRoute(
      {required _i32.OrderServiceModel orderServiceModel,
      required String currency,
      _i29.Key? key})
      : super(OrderServiceDetailsRoute.name,
            path: '/order-service-details-page',
            args: OrderServiceDetailsRouteArgs(
                orderServiceModel: orderServiceModel,
                currency: currency,
                key: key));

  static const String name = 'OrderServiceDetailsRoute';
}

class OrderServiceDetailsRouteArgs {
  const OrderServiceDetailsRouteArgs(
      {required this.orderServiceModel, required this.currency, this.key});

  final _i32.OrderServiceModel orderServiceModel;

  final String currency;

  final _i29.Key? key;

  @override
  String toString() {
    return 'OrderServiceDetailsRouteArgs{orderServiceModel: $orderServiceModel, currency: $currency, key: $key}';
  }
}

/// generated route for
/// [_i18.AddNewPatientPage]
class AddNewPatientRoute extends _i28.PageRouteInfo<AddNewPatientRouteArgs> {
  AddNewPatientRoute(
      {_i29.Key? key, int? id, required _i33.PatientState patientState})
      : super(AddNewPatientRoute.name,
            path: '/add-new-patient-page',
            args: AddNewPatientRouteArgs(
                key: key, id: id, patientState: patientState));

  static const String name = 'AddNewPatientRoute';
}

class AddNewPatientRouteArgs {
  const AddNewPatientRouteArgs({this.key, this.id, required this.patientState});

  final _i29.Key? key;

  final int? id;

  final _i33.PatientState patientState;

  @override
  String toString() {
    return 'AddNewPatientRouteArgs{key: $key, id: $id, patientState: $patientState}';
  }
}

/// generated route for
/// [_i19.AddressesPage]
class AddressesRoute extends _i28.PageRouteInfo<void> {
  const AddressesRoute() : super(AddressesRoute.name, path: '/addresses-page');

  static const String name = 'AddressesRoute';
}

/// generated route for
/// [_i20.PatientsPage]
class PatientsRoute extends _i28.PageRouteInfo<void> {
  const PatientsRoute() : super(PatientsRoute.name, path: '/patients-page');

  static const String name = 'PatientsRoute';
}

/// generated route for
/// [_i21.PrivacyPage]
class PrivacyRoute extends _i28.PageRouteInfo<void> {
  const PrivacyRoute() : super(PrivacyRoute.name, path: '/privacy-page');

  static const String name = 'PrivacyRoute';
}

/// generated route for
/// [_i22.CartPage]
class CartRoute extends _i28.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-page');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i23.CheckoutPage]
class CheckoutRoute extends _i28.PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: '/checkout-page');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i24.SettingsPage]
class SettingsRoute extends _i28.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i25.BundleDetailsPage]
class BundleDetailsRoute extends _i28.PageRouteInfo<BundleDetailsRouteArgs> {
  BundleDetailsRoute({required int bundleId, _i29.Key? key})
      : super(BundleDetailsRoute.name,
            path: '/bundle-details-page',
            args: BundleDetailsRouteArgs(bundleId: bundleId, key: key));

  static const String name = 'BundleDetailsRoute';
}

class BundleDetailsRouteArgs {
  const BundleDetailsRouteArgs({required this.bundleId, this.key});

  final int bundleId;

  final _i29.Key? key;

  @override
  String toString() {
    return 'BundleDetailsRouteArgs{bundleId: $bundleId, key: $key}';
  }
}

/// generated route for
/// [_i26.VerifyOtpCodeSlide]
class VerifyOtpCodeSlide extends _i28.PageRouteInfo<VerifyOtpCodeSlideArgs> {
  VerifyOtpCodeSlide(
      {_i29.Key? key,
      required String phoneNumber,
      required String userVerifyToken})
      : super(VerifyOtpCodeSlide.name,
            path: '/verify-otp-code-slide',
            args: VerifyOtpCodeSlideArgs(
                key: key,
                phoneNumber: phoneNumber,
                userVerifyToken: userVerifyToken));

  static const String name = 'VerifyOtpCodeSlide';
}

class VerifyOtpCodeSlideArgs {
  const VerifyOtpCodeSlideArgs(
      {this.key, required this.phoneNumber, required this.userVerifyToken});

  final _i29.Key? key;

  final String phoneNumber;

  final String userVerifyToken;

  @override
  String toString() {
    return 'VerifyOtpCodeSlideArgs{key: $key, phoneNumber: $phoneNumber, userVerifyToken: $userVerifyToken}';
  }
}

/// generated route for
/// [_i27.ArcaPaymentPage]
class ArcaPaymentRoute extends _i28.PageRouteInfo<ArcaPaymentRouteArgs> {
  ArcaPaymentRoute({_i29.Key? key, String? redirectUrl, String? vendorOrderId})
      : super(ArcaPaymentRoute.name,
            path: '/arca-payment-page',
            args: ArcaPaymentRouteArgs(
                key: key,
                redirectUrl: redirectUrl,
                vendorOrderId: vendorOrderId));

  static const String name = 'ArcaPaymentRoute';
}

class ArcaPaymentRouteArgs {
  const ArcaPaymentRouteArgs({this.key, this.redirectUrl, this.vendorOrderId});

  final _i29.Key? key;

  final String? redirectUrl;

  final String? vendorOrderId;

  @override
  String toString() {
    return 'ArcaPaymentRouteArgs{key: $key, redirectUrl: $redirectUrl, vendorOrderId: $vendorOrderId}';
  }
}
