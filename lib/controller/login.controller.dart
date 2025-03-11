import 'package:flutter/material.dart';
import 'package:flutter_testing/property/login.property.dart';
import 'package:flutter_testing/service/backend.service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final backendService = Get.find<BackendService>();

  final Rx<TextEditingController> usernameController =
      TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  RxBool hinPassword = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<SubmitResult> submit(String username, String password) async {
    username.toLowerCase();
    password.toLowerCase();
    if (username.isEmpty || password.isEmpty) {
      return SubmitResult(
          success: false,
          message: 'กรุณาระบุ username และ password ให้ครบถ้วน');
    }
    final result = await backendService.verifyCredentials(username, password);
    return result;
  }

  @override
  void onClose() {
    usernameController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}
