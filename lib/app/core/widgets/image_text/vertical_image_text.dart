import 'package:bus/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class NVerticalImageText extends StatelessWidget {
  const NVerticalImageText({
    super.key,
    this.image,
    this.iconData,
    required this.title,
    this.textColor = Colors.black,
    this.cardColor,
    this.iconBackgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.onTap,
    this.isSelected = false,
  });

  final String? image;
  final IconData? iconData;
  final String title;
  final Color textColor;
  final Color? cardColor;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final void Function()? onTap;
  final bool isSelected;
  

  @override
  Widget build(BuildContext context) {
    final Color effectiveCardColor = cardColor ?? const Color(0xFFF5F5F5);
    final Color effectiveIconColor = iconColor ?? Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: effectiveCardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: effectiveCardColor.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],

          border: isSelected ? Border.all(color: NColors.white, width: 2) : null,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackgroundColor ?? Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: iconData != null
                    ? Icon(iconData, color: effectiveIconColor, size: 20)
                    : image != null
                        ? ClipOval(
                            child: Image.asset(
                              image!,
                              width: 28,
                              height: 28,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.category, size: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
