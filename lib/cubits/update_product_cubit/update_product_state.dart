import 'package:store_app/models/product_model.dart';

abstract class UpdateProductState {}

class UpdateInitial extends UpdateProductState {}

class UpdateLoading extends UpdateProductState {}

class UpdateSuccess extends UpdateProductState {
  final ProductModel updatedProduct;

  UpdateSuccess(this.updatedProduct);
}

class UpdateFailure extends UpdateProductState {
  final String error;

  UpdateFailure({required this.error});
}
