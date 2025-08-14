import 'package:auto_route/auto_route.dart';
import 'package:bus/app/core/core.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: IAppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Yeni Gelenler",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          Text("VIEW 1"),
          SizedBox(width: 24),
        ],
      ),
    );
  }
}