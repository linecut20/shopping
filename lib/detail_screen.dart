import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constraints.dart';
import 'product.dart';

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
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",
              color: textColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",
              color: textColor,
            ),
            color: textColor,
            onPressed: () {},
          )
        ],
      ),

    );
  }
}