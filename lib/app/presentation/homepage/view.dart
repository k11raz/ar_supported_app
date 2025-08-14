import 'package:auto_route/auto_route.dart';
import 'package:bus/app/core/constants/colors.dart';
import 'package:bus/app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Image.asset(
                      'image/logos/logo3.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Text('Logo not found')),
                    ),
                  ),

                  SizedBox(height: 196,),
                  _CollectionCard(
                    imageUrl: 'image/images/img1.jpg',
                    title: "YENİ",
                    collectionName: "GÜRAL PORSELEN KOLEKSİYONU",
                    season: "YAZ 2025",
                  ),
                  SizedBox(height: 196),
                  _CollectionCard(
                    imageUrl: 'image/images/img2.jpg',
                    title: "ÖZEL",
                    collectionName: "GELENEKSEL KOLEKSİYON",
                    season: "KIŞ 2024",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  const _CollectionCard({
    required this.imageUrl,
    required this.title,
    required this.collectionName,
    required this.season,
  });

  final String imageUrl;
  final String title;
  final String collectionName;
  final String season;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
            ),
          ),
        ),
        const SizedBox(height: NSizes.spaceBtwInputFields),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: textTheme.titleSmall!.copyWith(color: Colors.black87),
              textAlign: TextAlign.end,
            ),
            Text(
              collectionName,
              style: textTheme.titleSmall!.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            Text(
              season,
              style: textTheme.titleSmall!.copyWith(color: Colors.black87),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }
}
