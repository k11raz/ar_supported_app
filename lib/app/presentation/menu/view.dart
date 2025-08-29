import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

@RoutePage()
class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            SizedBox(
              height: 24,
              child: BlocProvider(
                create: (_) => CategoryBloc(
                  getCategory: GetCategory(
                    CategoryRepositoryImpl(SupabaseCategoryRemoteDatasource(dio: sl<Dio>())),
                  ),
                )..add(FetchCategoryEvent()),
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryError) {
                      return Center(
                        child: Text(
                          "Hata: ${state.message}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (state is CategoryLoaded) {
                      if (state.categories.isEmpty) {
                        return const Center(
                          child: Text(
                            "Henüz Kategori yok",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              category.name,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),

            SizedBox(height: 64),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("image/images/img1.jpg", width: 196),
            ),
            SizedBox(height: 8),
            Text("AUTUMN WINTER COLLECTION"),
            SizedBox(height: 32),

            Expanded(
              child: BlocProvider(
                create: (_) => CategoryBloc(
                  getCategory: GetCategory(
                    CategoryRepositoryImpl(SupabaseCategoryRemoteDatasource(dio: sl<Dio>())),
                  ),
                )..add(FetchCategoryEvent()),
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryError) {
                      return Center(
                        child: Text(
                          "Hata: ${state.message}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (state is CategoryLoaded) {
                      if (state.categories.isEmpty) {
                        return const Center(
                          child: Text(
                            "Henüz Kategori yok",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text(
                              category.name,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
