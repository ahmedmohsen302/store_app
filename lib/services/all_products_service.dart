import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  final dio = Dio();

  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );

    List<ProductModel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(ProductModel.fromJson(data[i]));
    }
    return productlist;
  }
}
