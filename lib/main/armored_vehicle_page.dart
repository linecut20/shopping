import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';
import '../model/product.dart';
import 'main_product_item.dart';

class ArmoredVehiclePage extends StatefulWidget {
  const ArmoredVehiclePage({Key? key}) : super(key: key);

  @override
  State<ArmoredVehiclePage> createState() => _ArmoredVehiclePage();
}

class _ArmoredVehiclePage extends State<ArmoredVehiclePage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("armored_vehicle").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: Text("로딩"),
          );
        }

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
        print(products);

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