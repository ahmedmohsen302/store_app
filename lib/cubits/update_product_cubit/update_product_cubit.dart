import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/update_product_cubit/update_product_state.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateInitial());

  updateProducts({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    emit(UpdateLoading());
    try {
      ProductModel updatedProduct = await UpdateProductService().updateProduct(
        id: id,
        title: title,
        price: price,
        description: description,
        image: image,
        category: category,
      );
      emit(UpdateSuccess(updatedProduct));
    } catch (e) {
      emit(UpdateFailure(error: 'there has been an error : $e'));
    }
  }
}
