import 'package:bus/app/app.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
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

            SizedBox(height: 48),

            NSearchContainer(),

            const SizedBox(height: 16),
            const Divider(),
            SizedBox(height: 64),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.56,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("image/images/img1.jpg"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Güral Porselen",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.save_as_outlined),
                              ),
                            ],
                          ),
                          Text(
                            "500.00 TL",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("image/images/img1.jpg"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Güral Porselen",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.save_21),
                              ),
                            ],
                          ),
                          Text(
                            "500.00 TL",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset("image/images/img1.jpg"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Güral Porselen",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.save_21),
                              ),
                            ],
                          ),
                          Text(
                            "500.00 TL",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
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
