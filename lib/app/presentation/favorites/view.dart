import 'package:auto_route/auto_route.dart';
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
    final favoriteRepository = FavoritesRepositoryImpl(favoriteRemoteDataSource);
    final addToFavoritesUseCase = AddToFavoritesUseCase(favoriteRepository);
    final getFavorites = GetFavorites(favoriteRepository);

    return BlocProvider(
      create: (_) =>
          FavoritesBloc(addToFavoritesUseCase: addToFavoritesUseCase, getFavorites: getFavorites)
            ..add(FetchFavoritesEvent()),
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
