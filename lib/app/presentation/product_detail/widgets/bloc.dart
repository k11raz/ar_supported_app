import 'package:bus/app/domain/usecases/add_to_card.dart';
import 'package:bus/app/presentation/product_detail/widgets/event.dart';
import 'package:bus/app/presentation/product_detail/widgets/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final AddToCardUseCase addToCartUseCase;

  CardBloc({required this.addToCartUseCase}) : super(CardInitial()) {
    on<AddProductToCardEvent>(_onAddProduct);
  }

  Future<void> _onAddProduct(
      AddProductToCardEvent event, Emitter<CardState> emit) async {
    emit(CardLoading());

    try {
      await addToCartUseCase(
        userId: event.userId,
        productId: event.productId,
        quantity: event.quantity,
      );

      // Eğer REST API'den toplam item ve totalAmount çekmek istiyorsan burada ekle
      // Örnek:
      // final totals = await cartRepository.getCartTotals(event.userId);
      // emit(CartSuccess(totalItems: totals.items, totalAmount: totals.amount));

      emit(CardSuccess(totalItems: 0, totalAmount: 0)); // placeholder
    } catch (e) {
      emit(CardFailure(e.toString()));
    }
  }
}
