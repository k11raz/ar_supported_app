import 'package:bus/app/core/constants/colors.dart';
import 'package:bus/app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                'image/images/gp_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'image/images/img1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "YENİ",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "GÜRAL PORSELEN KOLEKSİYONU",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "YAZ 2025",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  const SizedBox(height: 144),
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'image/images/img1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "YENİ",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "GÜRAL PORSELEN KOLEKSİYONU",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "YAZ 2025",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                    ],
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
