import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';

import '../model/product.dart';
import 'main_product_item.dart';

class ShipMainPage extends StatefulWidget {
  const ShipMainPage({Key? key}) : super(key: key);

  @override
  State<ShipMainPage> createState() => _ShipMainPageState();
}

class _ShipMainPageState extends State<ShipMainPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("ship").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          final List<Product>products = [];

          for (var i in snapshot.requireData.docs) {
            var product = Product(
                i["title"],
                i["description"],
                i["price"] as int,
                i["size"],
                i["id"],
                i["type"],
                i["image"],
                i["subImage"]
            );
            products.add(product);
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.03
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => MainProductItem(product: products[index]),
          );
        },
      ),
    );
  }
}