import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';

import '../model/product.dart';
import 'main_product_item.dart';

class AirMainPage extends StatefulWidget {
  const AirMainPage({Key? key}) : super(key: key);

  @override
  State<AirMainPage> createState() => _AirMainPageState();
}

class _AirMainPageState extends State<AirMainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("tank").orderBy("release", descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
        final List<Product>products = [];

        for (var i in snapshot.requireData.docs) {
          var product = Product(
              i["title"],
              i["description"],
              i["price"] as int,
              i["size"],
              i["id"] as int,
              i["type"],
              i["image"],
              i["subImage"]
          );
          products.add(product);
        }

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
      },
    );
  }
}
