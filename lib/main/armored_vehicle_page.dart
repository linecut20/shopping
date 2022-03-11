import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';
import 'main_product_item.dart';

class ArmoredVehiclePage extends StatefulWidget {
  const ArmoredVehiclePage({Key? key}) : super(key: key);

  @override
  State<ArmoredVehiclePage> createState() => _ArmoredVehiclePage();
}

class _ArmoredVehiclePage extends State<ArmoredVehiclePage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var products = FirebaseFirestore.instance.collection("armed_vehicle").get() as Map;
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
        } else {
          return Container();
        }
      },
    );
  }
}