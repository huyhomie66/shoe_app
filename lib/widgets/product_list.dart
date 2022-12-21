import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> _items = List.generate(10, (i) => i);

    return Wrap(
      direction: Axis.vertical,
      children: _items.map((i) => Text('Item $i')).toList(),
    );
  }
}
