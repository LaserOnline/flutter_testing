import 'package:flutter_testing/widget/home.widget.dart';
import 'package:flutter_testing/widget/login.widget.dart';
import 'package:get/route_manager.dart';

class AppRouters {
  static final router = [
    GetPage(
      name: '/home',
      page: () => const HomeWidget(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginWidget(),
    ),
  ];
}
