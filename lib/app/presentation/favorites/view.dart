import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../app.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteRemoteDataSource = SupabaseFavoritesRemoteDataSource(
      dio: sl<Dio>(),
    );
    final favoriteRepository = FavoritesRepositoryImpl(
      favoriteRemoteDataSource,
    );
    final addToFavoritesUseCase = AddToFavoritesUseCase(favoriteRepository);
    final getFavorites = GetFavorites(favoriteRepository);

    return BlocProvider(
      create: (_) => FavoritesBloc(
        addToFavoritesUseCase: addToFavoritesUseCase,
        getFavorites: getFavorites,
        checkFavoriteUseCase: sl<CheckFavoriteUseCase>(),
        removeFavoritesUsecase: sl<RemoveFavoritesUsecase>(),
      )..add(FetchFavoritesEvent()),
      child: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
          if (state is FavoritesFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message.toString())));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is FavoritesLoading) ...[
                    const Center(child: CircularProgressIndicator()),
                  ] else if (state is FavoritesLoaded &&
                      state.favorites.isNotEmpty) ...[
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.favorites.length,
                        itemBuilder: (context, index) {
                          final item = state.favorites[index];
                          return  Slidable(
                              key: ValueKey(item.id),
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.20,
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.read<FavoritesBloc>().add(
                                            RemoveFavoritesEvent(id: item.productId),
                                          );
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Sil',
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: NColors.black,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          bottomLeft: Radius.circular(4),
                                        ),
                                        child: Image.network(
                                          item.imageUrl,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            "${item.price} TL",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Colors.grey[700],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.favorite_border_outlined, size: 56),
                            SizedBox(height: 16),
                            Text("YOUR FAVORITES IS EMPTY"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
