import 'package:bus/app/app.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final String? imagePath;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    this.cancelText = "Cancel",
    this.confirmText = "Yes",
    this.onCancel,
    this.onConfirm,
    this.imagePath,
    required this.backgroundColor,
    required this.foregroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: NColors.accent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null) Image.asset(imagePath!, width: 72),
            SizedBox(height: NSizes.spaceBtwSections),
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 4),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: NSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    foregroundColor: foregroundColor,
                    side: BorderSide(color: foregroundColor),
                  ),
                  onPressed: onCancel ?? () => Navigator.of(context).pop(),
                  child: Text(cancelText),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    foregroundColor: Colors.black,
                    backgroundColor: backgroundColor,
                    side: BorderSide(color: backgroundColor),
                  ),
                  onPressed: onConfirm ?? () => Navigator.of(context).pop(),
                  child: Text(confirmText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
