import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/detail/body.dart';
import '../product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({
    required this.product,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",
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