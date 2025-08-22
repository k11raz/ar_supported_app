import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NSearchContainerAnchor extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool showBackground;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const NSearchContainerAnchor({
    super.key,
    this.hintText = "NE ARIYORSUNUZ?",
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? TextEditingController();

    return SearchAnchor.bar(
      barHintText: hintText,
      barLeading: Icon(icon, color: Theme.of(context).iconTheme.color),
      barBackgroundColor: WidgetStatePropertyAll(
        showBackground ? Theme.of(context).colorScheme.surfaceVariant : Colors.transparent,
      ),
      barElevation: WidgetStateProperty.all(0),
      suggestionsBuilder: (context, searchController) {
        
        final query = searchController.text.toLowerCase();
        final dummyList = ["Elma", "Armut", "Muz", "Çilek", "Üzüm"];
        final results = dummyList.where((item) => item.toLowerCase().contains(query));

        return results.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              searchController.closeView(item);
              textController.text = item;
              if (onChanged != null) onChanged!(item);
            },
          );
        }).toList();
      },
    );
  }
}
