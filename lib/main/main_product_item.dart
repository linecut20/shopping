import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/constraints.dart';
import 'package:shopping/detail/detail_screen.dart';
import '../firebase_storage.dart';
import '../model/product.dart';

class MainProductItem extends StatefulWidget {
  final Product product;

  MainProductItem({
    required this.product,
    Key? key}) : super(key: key);

  @override
  State<MainProductItem> createState() => _MainProductItemState();
}

class _MainProductItemState extends State<MainProductItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(product: widget.product))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //배경 및 이미지
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            width: 170,
            height: 130,
            decoration: BoxDecoration(
              color: productColor(widget.product.type),
              borderRadius: BorderRadius.circular(16)
            ),
            child: storageImageMaker(image: widget.product.image, width: 160)
          ),

          //상품명
          Container(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(widget.product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textLightColor
                    ),
                  ),
                ),

                Text(NumberFormat('###,###,###,###').format(widget.product.price),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textHighLighColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}