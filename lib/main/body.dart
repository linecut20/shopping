import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';
import 'package:shopping/main/main_product_item.dart';
import '../product.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //상단부================
          Text("Women",
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor),
          ),
          const Categories(),

          //중단부================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.92
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => MainProductItem(product: products[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}