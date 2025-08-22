import 'package:auto_route/auto_route.dart';
import 'package:bus/app/data/datasources/remote/favorite.dart';
import 'package:bus/app/data/repositories/favorite_impl.dart';
import 'package:bus/app/domain/usecases/favorites/add_to_favorites.dart';
import 'package:bus/app/domain/usecases/favorites/get_favorites.dart';
import 'package:bus/app/presentation/favorites/bloc.dart';
import 'package:bus/app/presentation/favorites/event.dart';
import 'package:bus/app/presentation/favorites/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.imagePath,
    required this.images,
  });
  final ProductEntity product;
  final List<String> images;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final favoritesRemoteDataSource = SupabaseFavoritesRemoteDataSource();
    final favoritesRepositoryImpl = FavoriteRepositoryImpl(
      favoritesRemoteDataSource,
    );
    final addToFavoritesUseCase = AddToFavoritesUseCase(
      favoritesRepositoryImpl,
    );
    final getFavorites = GetFavorites(favoritesRepositoryImpl);
    return InkWell(
      onTap: () {
        context.router.push(
          ProductDetailRoute(
            product: product,
            images: [
              "image/images/img1.jpg",
              "image/images/img2.jpg",
              "image/images/img2.jpg",
            ],
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${product.price} TL",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              BlocProvider(
                create: (context) =>
                    FavoritesBloc(addToFavoritesUseCase, getFavorites),
                child: BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context.read<FavoritesBloc>().add(
                          AddProductToFavoritesEvent(product: product),
                        );
                      },
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
