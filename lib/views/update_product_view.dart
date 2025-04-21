import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/update_product_cubit/update_product_cubit.dart';
import 'package:store_app/cubits/update_product_cubit/update_product_state.dart';
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
            child: BlocListener<UpdateProductCubit, UpdateProductState>(
              listener: (context, state) {
                if (state is UpdateLoading) {
                  isLoading = true;
                } else if (state is UpdateSuccess) {
                  isLoading = false;
                  Navigator.pop(context, state.updatedProduct);
                } else if (state is UpdateFailure) {
                  isLoading = false;
                  throw Exception('there has been an error ${state.error}');
                }
              },
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

                      BlocProvider.of<UpdateProductCubit>(
                        context,
                      ).updateProducts(
                        id: product.id,
                        title: title ?? product.title,
                        price:
                            double.tryParse(
                              price ?? product.price.toString(),
                            ) ??
                            product.price,
                        description: dsecreption ?? product.description,
                        image: image ?? product.image,
                        category: product.category,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
