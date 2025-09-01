import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
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
    final double totalImagesHeight = images.length * 200;
    final formKey = GlobalKey<FormState>();
    final reviewController = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailBloc>(create: (_) => ProductDetailBloc()),
        BlocProvider<CardBloc>(
          create: (_) => CardBloc(
            addToCartUseCase: sl<AddToCartUseCase>(),
            getOrderItems: sl<GetOrderItems>(),
            removeOrderItemUseCase: sl<RemoveOrderItemUseCase>(),
          ),
        ),
        BlocProvider(
          create: (_) => ReviewBloc(
            addReviewUseCase: sl<AddReviewUseCase>(),
            fetchReviewUseCase: sl<FetchReviewUseCase>(),
            deleteReviewUseCase: sl<DeleteReviewUseCase>(),
          )..add(FetchReviewEvent(productId: product.id)),
        ),
      ],

      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          context.read<ProductDetailBloc>().add(
                            ProductDetailScrollChanged(
                              notification.metrics.pixels,
                              totalImagesHeight,
                            ),
                          );
                        }
                        return false;
                      },
                      child: CustomScrollView(
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
                                    color:
                                        Theme.of(context).iconTheme.color ??
                                        Colors.black,
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
                                      child: Image.asset(
                                        img,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "3 BOYUTLU OLARAK GÖRÜNTÜLE",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleLarge,
                                      ),
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
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "${product.description}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 24),
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: const Text(
                                    'ÜRÜN BOYUTLARI',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: <Widget>[
                                    ListTile(title: Text('...')),
                                  ],
                                ),
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: const Text(
                                    'BİLEŞENLER VE BAKIM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: <Widget>[
                                    ListTile(title: Text('...')),
                                  ],
                                ),
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: const Text(
                                    'KARGO DEĞİŞİM VE İADE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: <Widget>[
                                    ListTile(title: Text('...')),
                                  ],
                                ),
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: const Text(
                                    'MAĞAZA STOK DURUMU',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  children: <Widget>[
                                    ListTile(
                                      title: Text("${product.stock} ADET"),
                                    ),
                                  ],
                                ),
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: Text(
                                    'ÜRÜN YORUMLARI',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  children: <Widget>[
                                    BlocBuilder<ReviewBloc, ReviewState>(
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            Form(
                                              key: formKey,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: CustomTextFormField(
                                                      hintText:
                                                          "Yorumunuzu yazın",
                                                      controller:
                                                          reviewController,
                                                      suffixIcon: const Icon(
                                                        Iconsax.direct,
                                                      ),
                                                      prefixIcon: const Icon(
                                                        Iconsax.direct_right,
                                                      ),
                                                      validator: (value) =>
                                                          value != null &&
                                                              value.isNotEmpty
                                                          ? null
                                                          : 'Geçerli bir yorum girin.',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  CustomButton(
                                                    text: "Gönder",
                                                    onPressed: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        context.read<ReviewBloc>().add(
                                                          AddReviewToProductEvent(
                                                            productId:
                                                                product.id,
                                                            review: ReviewEntity(
                                                              id: '',
                                                              productId:
                                                                  product.id,
                                                              comment:
                                                                  reviewController
                                                                      .text,
                                                              rating: 5,
                                                              userId:
                                                                  sl<
                                                                        UserCacheService
                                                                      >()
                                                                      .getUserId()
                                                                      .toString(),
                                                              createdAt:
                                                                  DateTime.now(),
                                                            ),
                                                          ),
                                                        );
                                                        reviewController
                                                            .clear();
                                                      }
                                                    },
                                                    primaryColor: Colors.black,
                                                    secondaryColor:
                                                        Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 16),

                                            if (state is ReviewsLoading) ...[
                                              const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ] else if (state is ReviewsLoaded &&
                                                state.reviews.isNotEmpty) ...[
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: state.reviews.length,
                                                itemBuilder: (context, index) {
                                                  final item =
                                                      state.reviews[index];
                                                  return SizedBox(
                                                    width: double.infinity,
                                                    child: Card(
                                                      elevation: 2,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              12.0,
                                                            ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 22,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blue,
                                                                  child: const Icon(
                                                                    Icons
                                                                        .verified_user,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${item.name} ${item.surname}",
                                                                    style: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                ),

                                                                  IconButton(
                                                                    onPressed: () {
                                                                      context
                                                                          .read<
                                                                            ReviewBloc
                                                                          >()
                                                                          .add(
                                                                            RemoveReviewEvent(
                                                                              reviewId: item.reviewId,
                                                                            ),
                                                                          );
                                                                    },
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),

                                                            const SizedBox(
                                                              height: 12,
                                                            ),

                                                            /// Yorum
                                                            Text(
                                                              item.comment,
                                                              style:
                                                                  const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black87,
                                                                  ),
                                                            ),

                                                            const SizedBox(
                                                              height: 8,
                                                            ),

                                                            /// Tarih
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Text(
                                                                item.createdAt
                                                                    .toIso8601String(),
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ] else ...[
                                              const Padding(
                                                padding: EdgeInsets.all(16),
                                                child: Text("Henüz yorum yok."),
                                              ),
                                            ],
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 24),
                                const Divider(),
                                const SizedBox(height: 16),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      bottom: state.hideBottomSheet ? -150 : 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 144,
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context).textTheme.titleLarge,
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
                                  onPressed: () {
                                    context.read<CardBloc>().add(
                                      AddProductToCardEvent(
                                        product: product,
                                        quantity: 1,
                                      ),
                                    );
                                  },
                                  primaryColor: Colors.black,
                                  secondaryColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
