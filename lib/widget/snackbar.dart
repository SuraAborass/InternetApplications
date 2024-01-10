import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green);
  }

  static void showError(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style:const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15),
          textAlign: TextAlign.center,
        ),
        backgroundColor:Colors.red);
  }

 /* static void showWarning(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: titleCopy7.apply(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.error);
  }*/
}