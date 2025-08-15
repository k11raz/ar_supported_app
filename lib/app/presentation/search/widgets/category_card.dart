import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../app.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductCategoryRoute(
          category: category
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: Text(
          category.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}