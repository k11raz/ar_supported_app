import 'package:bus/app/domain/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object?> get props => [];
}

class FetchReviewEvent extends ReviewEvent {
  final String productId;

  const FetchReviewEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class AddReviewToProductEvent extends ReviewEvent {
  final ReviewEntity review;
  final String productId;

  const AddReviewToProductEvent({required this.productId, required this.review});

  @override
  List<Object?> get props => [productId, review];
}

class RemoveReviewEvent extends ReviewEvent {
  final String reviewId;

  const RemoveReviewEvent({required this.reviewId});

  @override
  List<Object?> get props => [reviewId];
}
