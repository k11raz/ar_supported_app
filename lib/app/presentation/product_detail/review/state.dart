import 'package:bus/app/domain/entities/review_item_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewState {
  @override
  List<Object> get props => [];
}

class ReviewsLoading extends ReviewState {
  @override
  List<Object> get props => [];
}

class ReviewsLoaded extends ReviewState {
  final List<ReviewItemEntity> reviews;
  const ReviewsLoaded(this.reviews);

  @override
  List<Object> get props => [reviews];
}

class ReviewsFailure extends ReviewState {
  final String message;

  const ReviewsFailure(this.message);

  @override
  List<Object> get props => [message];
}
