import 'package:auto_route/auto_route.dart';
import 'package:bus/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: IAppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, 
          icon: Icon(Icons.message_outlined)
        )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "SHOPPING BAG[0]"
                ),

                SizedBox(width: 16),
        
                Text(
                  "FAVORITES"
                ),
              ],
            ),

            SizedBox(
              height: 64,
            ),

            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 56,
                  ),

                  SizedBox(height: 16),

                  Text(
                    "YOUR BAG IS EMPTY",
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 64,
            ),

            Text(
              "YOU MAY ALSO LIKE",
            ),

             SizedBox(
              height: 32,
            ),

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