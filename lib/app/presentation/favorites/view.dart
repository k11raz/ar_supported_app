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
import 'package:iconsax/iconsax.dart';
import '../../app.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteRemoteDataSource = SupabaseFavoritesRemoteDataSource();
    final favoriteRepository = FavoriteRepositoryImpl(favoriteRemoteDataSource);
    final addToFavoritesUseCase = AddToFavoritesUseCase(favoriteRepository);
    final getFavorites = GetFavorites(favoriteRepository);

    return BlocProvider(
      create: (_) =>
          FavoritesBloc(addToFavoritesUseCase, getFavorites)
            ..add(FetchFavoritesEvent()), // Sepeti yükle
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
            appBar: IAppBar(
              backgroundColor: Colors.black,
              title: const Text("Favorites"),
              actions: [
                IconButton(
                  onPressed: () {
                    context.router.back();
                  },
                  icon: const Icon(Icons.message_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
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
                          return ListTile(
                            leading: Image.network(item.imageUrl),
                            title: Text(item.name),
                            subtitle: Text("${item.price} TL"),
                            trailing: IconButton(
                              icon: const Icon(Iconsax.trash),
                              onPressed: () {},
                            ),
                          );
                        },
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
