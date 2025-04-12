import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key});
  static String id = 'updateProuductView';

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? title;

  String? price;

  String? image;

  String? dsecreption;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Update Prouduct',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                CustomTextField(
                  hintText: 'Name',
                  labelText: 'Product name',
                  onChanged: (data) {
                    title = data;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Description',
                  labelText: 'Product description',
                  onChanged: (data) {
                    dsecreption = data;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Price',
                  labelText: 'Product price',
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Image',
                  labelText: 'Product image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(height: 50),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      ProductModel updatedProduct = await update(product);
                      Navigator.pop(
                        context,
                        updatedProduct,
                      ); // ✅ Return updated product here
                    } catch (e) {
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ProductModel> update(ProductModel product) async {
    final updatedProduct = ProductModel(
      id: product.id,
      title: title ?? product.title,
      price: price ?? product.price,
      description: dsecreption ?? product.description,
      image: image ?? product.image,
      category: product.category,
      rating: product.rating, // keep the same rating
    );

    await UpdateProductService().updateProduct(
      id: updatedProduct.id,
      title: updatedProduct.title,
      price: updatedProduct.price,
      description: updatedProduct.description,
      image: updatedProduct.image,
      category: updatedProduct.category,
    );
    return updatedProduct;
  }
}
