import 'package:bus/app/app.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Row(
              children: [
                Text("WOMAN", style: Theme.of(context).textTheme.titleMedium),

                SizedBox(width: NSizes.spaceBtwItems),

                Text("MAN", style: Theme.of(context).textTheme.titleMedium),

                SizedBox(width: NSizes.spaceBtwItems),

                Text("KIDS", style: Theme.of(context).textTheme.titleMedium),

                SizedBox(width: NSizes.spaceBtwItems),

                Text("HOME", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),

            SizedBox(height: 64),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "image/images/img1.jpg",
                width: 196,
              ),
            ),
            SizedBox(height: 8),
            Text("AUTUMN WINTER COLLECTION"),
            SizedBox(height: 32),

            Text("THE NEW"),
            SizedBox(height: 8),
            Text("50TH ANNIVERSARY"),
            SizedBox(height: 8),
            Text("DENIM TOUCH"),
          ],
        ),
      ),
    );
  }
}
