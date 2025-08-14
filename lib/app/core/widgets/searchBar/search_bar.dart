import 'package:bus/app/core/extensions/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NSearchContainer extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool showBackground;
  final ValueChanged<String>? onChanged;

  const NSearchContainer({
    super.key,
    this.hintText = "NE ARIYORSUNUZ? ",
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).fieldCustom,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).iconTheme.color ?? Colors.black),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              //onChanged: onChanged,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
