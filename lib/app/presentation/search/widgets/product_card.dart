import 'package:auto_route/auto_route.dart';
import 'package:bus/app/domain/usecases/favorites/check_favorite.dart';
import 'package:bus/app/domain/usecases/favorites/remove_favorites_usecase.dart';
import 'package:dio/dio.dart';
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
    final favoritesRemoteDataSource = SupabaseFavoritesRemoteDataSource(
      dio: sl<Dio>(),
    );
    final favoritesRepositoryImpl = FavoritesRepositoryImpl(
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
                create: (context) => FavoritesBloc(
                  addToFavoritesUseCase: addToFavoritesUseCase,
                  getFavorites: getFavorites,
                  checkFavoriteUseCase: sl<CheckFavoriteUseCase>(),
                  removeFavoritesUsecase: sl<RemoveFavoritesUsecase>()
                ),
                child: BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                    final favorites = state is FavoritesLoaded
                        ? state.favorites
                        : [];
                    final isFavorite = favorites.any((p) => p.productId == product.id);

                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        context.read<FavoritesBloc>().add(
                          ToggleFavoritesEvent(product: product),
                        );
                      },
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
