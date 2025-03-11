import 'package:flutter/material.dart';
import 'package:flutter_testing/components/dialog.components.dart';
import 'package:flutter_testing/service/backend.service.dart';
import 'package:flutter_testing/widget/login.widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> delayTime(WidgetTester tester, {int seconds = 10}) async {
  await tester.pumpAndSettle();
  for (int i = 1; i <= seconds; i++) {
    print("Delay: $i second(s)");
    await tester.pump(const Duration(seconds: 1));
  }
}

Future<void> initServices() async {
  await Get.putAsync<BackendService>(() async => await BackendService().init());
}

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await initServices();

  testWidgets('ทดสอบการกรอกข้อมูลว่างในหน้า Login',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const GetMaterialApp(home: LoginWidget());
        },
      ),
    );

    final usernameField = find.byKey(const Key('username'));
    final passwordField = find.byKey(const Key('password'));
    final submitButton = find.byKey(const Key('login'));
    await tester.enterText(usernameField, 'helloworld');
    await tester.enterText(passwordField, 'password');
    await tester.pumpAndSettle();
    await delayTime(tester, seconds: 2);
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.byType(ActiveComponent), findsOneWidget);

    final cancelButton = find.text('Cancel');
    await delayTime(tester, seconds: 2);
    await tester.tap(cancelButton);
    await tester.pumpAndSettle();

    expect(find.byType(ActiveComponent), findsNothing);
    await delayTime(tester, seconds: 10);
  });
}
