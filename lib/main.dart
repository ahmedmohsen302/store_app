import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/update_product_cubit/update_product_cubit.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/views/update_product_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProductCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => HomeView(),
          UpdateProductView.id: (context) => UpdateProductView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
