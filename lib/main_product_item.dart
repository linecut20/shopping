import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';
import 'product.dart';

class MainProductItem extends StatelessWidget {
  final Product product;

  const MainProductItem({
    required this.product,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //배경 및 이미지
        Container(
          padding: EdgeInsets.all(defaultPadding),
          width: 180,
          height: 200,
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(product.image),
        ),

        //상품명
        Container(
          width: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(product.title,
                  style: TextStyle(
                    color: textLightColor
                  ),
                ),
              ),

              Text("\$${product.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}