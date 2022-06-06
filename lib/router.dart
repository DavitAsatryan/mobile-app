import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/ui/pages/bundle/bundle_page.dart';
import 'package:cursus_app/ui/pages/forgot_password/forgot_password.dart';
import 'package:cursus_app/ui/pages/intro_page.dart';
import 'package:cursus_app/ui/pages/main_navigation/laboratory_screen.dart';
import 'package:cursus_app/ui/pages/main_navigation/subcategory_page.dart';
import 'package:cursus_app/ui/pages/order/new_order_page.dart';
import 'package:cursus_app/ui/pages/payment/payment_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/about_us_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/add_new_address.dart';
import 'package:cursus_app/ui/pages/secondary_flow/add_new_patient.dart';
import 'package:cursus_app/ui/pages/secondary_flow/addresses_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/bundle_details_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/cards_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/cart_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/checkout_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/help_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/order_details.dart';
import 'package:cursus_app/ui/pages/secondary_flow/order_service_details.dart';
import 'package:cursus_app/ui/pages/secondary_flow/patients_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/personal_data.dart';
import 'package:cursus_app/ui/pages/secondary_flow/privacy_page.dart';
import 'package:cursus_app/ui/pages/secondary_flow/settings_page.dart';
import 'package:cursus_app/ui/pages/services/services_page.dart';
import 'package:cursus_app/ui/pages/verify_account/verify_account.dart';
import 'package:cursus_app/ui/pages/verify_account/verify_otp_code_slide.dart';

import 'ui/pages/authentication/authorization_page.dart';
import 'ui/pages/main_navigation/dashbord_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: IntroPage, initial: true),
    AutoRoute(page: AuthorizationPage),
    AutoRoute(page: DashboardPage),
    AutoRoute(page: ForgotPasswordPage),
    AutoRoute(page: LaboratoryPage),
    AutoRoute(page: SubCategoryPage),
    AutoRoute(page: NewOrderPage),
    AutoRoute(page: ServicesPage),
    AutoRoute(page: BundlesPage),
    AutoRoute(page: VerifyAccountPage),
    AutoRoute(page: CardsPage),
    AutoRoute(page: PersonalDataPage),
    AutoRoute(page: AboutPage),
    AutoRoute(page: HelpPage),
    AutoRoute(page: OrderDetailsPage),
    AutoRoute(page: AddNewAddressPage),
    AutoRoute(page: OrderServiceDetailsPage),
    AutoRoute(page: AddNewPatientPage),
    AutoRoute(page: AddressesPage),
    AutoRoute(page: PatientsPage),
    AutoRoute(page: PrivacyPage),
    AutoRoute(page: CartPage),
    AutoRoute(page: CheckoutPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: BundleDetailsPage),
    AutoRoute(page: VerifyOtpCodeSlide),
    AutoRoute(page: ArcaPaymentPage),
  ],
)
class $FlutterRouter {}
