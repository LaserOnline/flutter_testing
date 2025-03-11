import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldUsernameComponents extends StatelessWidget {
  const TextFieldUsernameComponents(
      {super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(80),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.justify,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}

class TextFieldPasswordComponents extends StatelessWidget {
  const TextFieldPasswordComponents({
    super.key,
    required this.title,
    required this.controller,
    required this.hintPassword,
  });
  final String title;
  final TextEditingController controller;
  final RxBool hintPassword;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: Adaptive.w(80),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.justify,
          cursorColor: Theme.of(context).colorScheme.primary,
          obscureText: hintPassword.value,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: title,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            suffixIcon: IconButton(
              onPressed: () {
                hintPassword.value = !hintPassword.value;
              },
              icon: Icon(
                hintPassword.value ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldSearchComponents extends StatelessWidget {
  const TextFieldSearchComponents(
      {super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(90),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.justify,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}

class TextFieldSearchBarComponents extends StatelessWidget {
  const TextFieldSearchBarComponents(
      {super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(60),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.justify,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
