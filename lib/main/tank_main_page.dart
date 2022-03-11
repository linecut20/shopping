import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';

import '../model/product.dart';
import 'main_product_item.dart';

class TankMainPage extends StatefulWidget {
  const TankMainPage({Key? key}) : super(key: key);

  @override
  State<TankMainPage> createState() => _TankMainPageState();
}

class _TankMainPageState extends State<TankMainPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.92
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => MainProductItem(product: products[index]),
      ),
    );
  }
}
