import 'dart:developer';
import 'package:bus/app/domain/entities/category_entity.dart';
import 'package:bus/app/domain/usecases/category/get_category.dart';
import 'package:bus/app/presentation/category/event.dart';
import 'package:bus/app/presentation/category/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategory getCategory;

  CategoryBloc({required this.getCategory}) : super(CategoryInitial()) {
    on<FetchCategoryEvent>(onLoadCategories);
  }

  Future<void> onLoadCategories(
    FetchCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final List<CategoryEntity> categories = await getCategory();
      emit(CategoryLoaded(categories));
      log(categories.toString());
    } catch (e) {
      emit(CategoryError('Ürünler yüklenemedi.'));
      log(e.toString());
    }
  }
}
