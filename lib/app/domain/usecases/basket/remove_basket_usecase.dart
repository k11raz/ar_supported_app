import '../../../app.dart';

class RemoveOrderItemUseCase {
  final CardRepository repository;

  RemoveOrderItemUseCase(this.repository);

    Future<void> call({String? id}) async {
    return await repository.deleteProductItem(id: id);
  }
}
