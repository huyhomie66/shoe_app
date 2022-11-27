import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.title});

  final String title;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: [
          Container(
              width: 267,
              height: 64,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 40,
                    left: 0,
                    child: Text(
                      'Welcome Back You’ve Been Missed!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(112, 123, 129, 1),
                          fontFamily: 'Airbnb Cereal App',
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.5),
                    )),
                Positioned(
                    top: 0,
                    child: Text(
                      'Hello Again!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Airbnb Cereal App',
                          fontSize: 28,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.2857142857142858),
                    )),
              ]))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
