import 'package:bus/app/core/extensions/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// enum EquipmentStatusFilter { hepsi, bos, arizali, aktif, bakimda }

class NSearchContainerDropdown extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool showBackground;
  final ValueChanged<String>? onChanged;
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;

  const NSearchContainerDropdown({
    super.key,
    this.hintText = "Search",
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    required this.onChanged,
    required this.selectedStatus,
    required this.onStatusChanged,
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
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon, color:  Theme.of(context).iconTheme.color ?? Colors.black),
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
              onChanged: onChanged,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(width: 12),
          DropdownButton<String>(
            value: selectedStatus.isEmpty ? null : selectedStatus,
            hint: Text(
              "Hepsi",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            borderRadius: BorderRadius.circular(16),
            underline: const SizedBox(),
            icon: Icon(Iconsax.search_normal, size: 16, color: Theme.of(context).iconTheme.color ?? Colors.black),
            dropdownColor: Theme.of(context).fieldCustom,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).iconTheme.color ?? Colors.black),
            onChanged: (value) {
              if (value != null) onStatusChanged(value);
            },
            items: [
              'Hepsi',
              'Boşta',
              'Arızalı',
              'Aktif',
              'Bakımda',
            ].map((status) {
              return DropdownMenuItem<String>(
                value: status == 'Hepsi' ? '' : status,
                child: Text(status),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
