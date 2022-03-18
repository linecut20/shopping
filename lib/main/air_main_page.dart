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
  var getDataTask;

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: StreamBuilder(
        stream: getDataTask,
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
          if (!snapshot.hasData) return Container();
          else {
            var datas = snapshot.requireData;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8
              ),
              cacheExtent: 9999,
              itemCount: datas.size,
              itemBuilder: (context, index) => MainProductItem(
                product: Product(
                  datas.docs[index]["title"],
                  datas.docs[index]["description"],
                  datas.docs[index]["price"] as int,
                  datas.docs[index]["size"],
                  datas.docs[index]["id"],
                  datas.docs[index]["type"],
                  datas.docs[index]["image"],
                  datas.docs[index]["subImage"],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void getData() {
    getDataTask = FirebaseFirestore.instance.collection("air").orderBy("release", descending: true).snapshots();
  }
}
