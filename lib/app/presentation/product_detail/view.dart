import 'package:auto_route/auto_route.dart';
import 'package:bus/app/core/core.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailView extends StatelessWidget {
  final String name;
  final String price;
  final List<String> images;

  const ProductDetailView({
    super.key,
    required this.name,
    required this.price,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            backgroundColor: Theme.of(context).fieldCustom,
            elevation: 0,
            pinned: false,
            floating: true,
            leading: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () => context.router.back(),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Theme.of(context).iconTheme.color ?? Colors.black,
                    size: 16,
                  ),
                  onPressed: () {},
                  tooltip: 'Sepet',
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.all(24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ...images.map(
                    (img) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$price TL",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Ürün Açıklaması...",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),

                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: const Text('ÜRÜN BOYUTLARI', style: TextStyle(fontWeight: FontWeight.bold)),
                    children: <Widget>[
                      ListTile(
                        title: Text('...')),
                    ],
                  ),

                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: const Text('BİLEŞENLER VE BAKIM', style: TextStyle(fontWeight: FontWeight.bold)),
                    children: <Widget>[
                      ListTile(
                        title: Text('...')),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: const Text('KARGO DEĞİŞİM VE İADE', style: TextStyle(fontWeight: FontWeight.bold)),
                    children: <Widget>[
                      ListTile(
                        title: Text('...')),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: const Text('MAĞAZA STOK DURUMU', style: TextStyle(fontWeight: FontWeight.normal)),
                    children: <Widget>[
                      ListTile(
                        title: Text('...')
                      ),
                    ],
                  ),

                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

