import 'package:bus/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon = Icons.arrow_forward_ios,
    required this.primaryColor,
    required this.secondaryColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: NColors.white,
            width: 1
          ),
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (isLoading) ...[
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            ] else ...[
              
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  color: NColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
