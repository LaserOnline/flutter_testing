import 'package:flutter/material.dart';
import 'package:flutter_testing/router/routers.dart';
import 'package:flutter_testing/service/backend.service.dart';
import 'package:flutter_testing/widget/oops.widget.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<BackendService>(() async => await BackendService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        getPages: AppRouters.router,
        unknownRoute: GetPage(
          name: '/oops',
          page: () => const OOPS(),
        ),
      );
    });
  }
}
