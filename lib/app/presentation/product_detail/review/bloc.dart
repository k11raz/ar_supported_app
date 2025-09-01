import 'dart:developer';
import 'package:bus/app/domain/entities/review_entity.dart';
import 'package:bus/app/domain/usecases/review/add_review.dart';
import 'package:bus/app/domain/usecases/review/delete_review.dart';
import 'package:bus/app/domain/usecases/review/fetch_review.dart';
import 'package:bus/app/presentation/product_detail/review/event.dart';
import 'package:bus/app/presentation/product_detail/review/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  AddReviewUseCase addReviewUseCase;
  FetchReviewUseCase fetchReviewUseCase;
  DeleteReviewUseCase deleteReviewUseCase;

  ReviewBloc({
    required this.addReviewUseCase,
    required this.fetchReviewUseCase,
    required this.deleteReviewUseCase,
  }) : super(ReviewsInitial()) {
    on<AddReviewToProductEvent>(onAddProduct);
    on<FetchReviewEvent>(onFetchReviews);
    on<RemoveReviewEvent>(removeReview);
  }

  Future<void> removeReview(
    RemoveReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewsLoading());

    try {
      await deleteReviewUseCase(reviewId: event.reviewId);

      final updatedReviews = await fetchReviewUseCase();
      emit(ReviewsLoaded(updatedReviews));
    } catch (e) {
      log('RemoveReviewEvent error: $e');
      emit(ReviewsFailure(e.toString()));
    }
  }

  Future<void> onAddProduct(
    AddReviewToProductEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewsLoading());

    try {
      List<ReviewEntity> updatedItems = [];

      final index = updatedItems.indexWhere(
        (i) => i.productId == event.productId,
      );

      if (index != -1) {
        final existing = updatedItems[index];
        updatedItems[index] = ReviewEntity(
          id: existing.id,
          productId: existing.productId,
          userId: existing.userId,
          createdAt: DateTime.now(), 
          rating: existing.rating, 
          comment: existing.comment,
        );
      } else {
        updatedItems.add(
          ReviewEntity(
            id: event.review.id,
            productId: event.review.productId,
            userId: event.review.userId,
            createdAt: DateTime.now(), 
            rating: event.review.rating, 
            comment: event.review.comment,
          ),
        );
      }

      await addReviewUseCase(productId: event.productId, review: event.review);
    } catch (e) {
      emit(ReviewsFailure(e.toString()));
    }
  }

  Future<void> onFetchReviews(
    FetchReviewEvent event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewsLoading());
    try {
      final data = await fetchReviewUseCase(productId: event.productId);
      emit(ReviewsLoaded(data));
    } catch (e, s) {
      log('FetchReviewEvent error: $e', stackTrace: s);
      emit(ReviewsFailure('Favori Ürünler yüklenemedi.'));
    }
  }
}
