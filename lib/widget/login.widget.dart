import 'package:flutter/material.dart';
import 'package:flutter_testing/components/button.components.dart';
import 'package:flutter_testing/components/dialog.components.dart';
import 'package:flutter_testing/components/textfield.components.dart';
import 'package:flutter_testing/controller/login.controller.dart';
import 'package:get/get.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              key: const Key('username'),
              padding: const EdgeInsets.all(8.0),
              child: TextFieldUsernameComponents(
                title: 'Username',
                controller: loginController.usernameController.value,
              ),
            ),
            Padding(
              key: const Key('password'),
              padding: const EdgeInsets.all(8.0),
              child: TextFieldPasswordComponents(
                title: 'Password',
                controller: loginController.passwordController.value,
                hintPassword: loginController.hinPassword,
              ),
            ),
            Padding(
              key: const Key('login'),
              padding: const EdgeInsets.all(8.0),
              child: ButtonComponents(
                title: 'submit',
                onPressed: () async {
                  final result = await loginController.submit(
                    loginController.usernameController.value.text,
                    loginController.passwordController.value.text,
                  );
                  if (result.success) {
                    Get.offAllNamed('/home');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ActiveComponent(
                          title: 'แจ้งเตือน',
                          message: result.message,
                          onConfirm: () {},
                          onCancel: () {},
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
