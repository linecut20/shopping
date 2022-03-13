import 'package:flutter/material.dart';
import 'package:shopping/detail/body.dart';
import '../model/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({
    required this.product,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productColor(product.type),
      appBar: AppBar(
        backgroundColor: productColor(product.type),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 10)
        ],
      ),

      body: Body(product: product),
    );
  }
}