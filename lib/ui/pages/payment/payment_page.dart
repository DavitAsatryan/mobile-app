import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/store/checkout/checkout_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../router.gr.dart';

class ArcaPaymentPage extends StatefulWidget {
  final String? redirectUrl;
  final String? vendorOrderId;

  const ArcaPaymentPage({Key? key, this.redirectUrl, this.vendorOrderId})
      : super(key: key);

  @override
  _ArcaPaymentPageState createState() => _ArcaPaymentPageState();
}

class _ArcaPaymentPageState extends State<ArcaPaymentPage> {
  final checkoutState = GetIt.I<CheckoutState>();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.textPurpleColor,
          ),
          onPressed: () async {
            await checkoutState.checkPaymentStatus(widget.vendorOrderId!);
            AutoRouter.of(context).navigate(const DashboardRoute());
          },
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: widget.redirectUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        );
      }),
    );
  }
}
