import 'package:cursus_app/constants/theme/app_theme.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';

import 'screen_size_accessor.dart';

void showCustomOverlayNotification({
  required Color color,
  required String text,
  Key? key,
  Duration duration = const Duration(seconds: 3),
}) {
  showOverlayNotification(
    (context) => SafeArea(
      child: GestureDetector(
        onVerticalDragStart: (_) {
          OverlaySupportEntry.of(context)!.dismiss();
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: greenishBeige.withOpacity(0.3),
                  blurRadius: 30, // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: SizedBox(
                  width: screenWidth(context) * 0.8,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ).tr(),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    duration: duration,
    key: key,
  );
}

