import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ActiveComponent extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ActiveComponent({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(Adaptive.w(4)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Adaptive.h(2)),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Adaptive.h(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  key: const Key('onCancel'),
                  onPressed: () {
                    Get.back();
                    onCancel();
                  },
                  child: const Text(
                    "Cancel",
                  ),
                ),
                TextButton(
                  key: const Key('onConfirm'),
                  onPressed: () {
                    Get.back();
                    onConfirm();
                  },
                  child: const Text(
                    "Confirm",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
