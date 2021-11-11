import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationUtils {
  static Future<void> openDialog() async {
    showDialog(
        context: Get.overlayContext,
        builder: (_) => WillPopScope(
            child: const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                ),
              ),
            ),
            onWillPop: () async => false));
  }

  static Future<void> closeDialog() async {
    Navigator.of(Get.overlayContext).pop();
  }
}
