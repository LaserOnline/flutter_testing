// backend_service.dart
import 'package:flutter_testing/property/login.property.dart';
import 'package:get/get.dart';

class BackendService extends GetxService {
  final RxString _username = 'laseronline'.obs;
  final RxString _password = 'password'.obs;

  Future<BackendService> init() async {
    return this;
  }

  Future<SubmitResult> verifyCredentials(
      String username, String password) async {
    if (username == _username.value && password == _password.value) {
      return SubmitResult(success: true, message: 'Login success');
    } else {
      return SubmitResult(
          success: false, message: 'Invalid username or password');
    }
  }
}
