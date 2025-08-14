import 'package:bus/app/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  const CategoryState();

  CategoryState copyWith({int? count}) {
    return CategoryState();
  }

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  const CategoryLoaded(this.categories);
  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);

  @override
  List<Object> get props => [message];
}
