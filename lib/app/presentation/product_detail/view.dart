import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../app.dart';

@RoutePage()
class ProductDetailView extends StatelessWidget {
  final ProductEntity product;
  final List<String> images;

  const ProductDetailView({
    super.key,
    required this.product,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildSheet(context),
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
                  borderRadius: BorderRadius.circular(12),
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
              delegate: SliverChildListDelegate([
                ...images.map(
                  (img) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(img, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${product.price} TL",
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ürün Açıklaması...",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'ÜRÜN BOYUTLARI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[ListTile(title: Text('...'))],
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'BİLEŞENLER VE BAKIM',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[ListTile(title: Text('...'))],
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'KARGO DEĞİŞİM VE İADE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[ListTile(title: Text('...'))],
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'MAĞAZA STOK DURUMU',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  children: <Widget>[ListTile(title: Text('...'))],
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet(BuildContext context) {
    return Container(
      height: 144,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),

            SizedBox(height: 4),

            Text(
              "${product.price} TL",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            SizedBox(height: 4),

            Container(
              alignment: Alignment.center,

              child: CustomButton(
                text: "SEPETE EKLE",
                onPressed: () {},
                primaryColor: Colors.black,
                secondaryColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
