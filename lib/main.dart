import 'package:flutter/material.dart';
import 'package:store_app/views/home_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeView.id: (context) => HomeView()},
      initialRoute: HomeView.id,
    );
  }
}
