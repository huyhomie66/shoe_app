import 'package:flutter/material.dart';
import 'package:sneakerapp/screens/home.dart';
import 'package:sneakerapp/screens/onboard.dart';
import 'package:sneakerapp/screens/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const Onboard(
              title: 'test',
            ),
        '/': (context) => const Home(),
        '/products': (context) => const ProductsPage(
              title: 'test',
            )
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
