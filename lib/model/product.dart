import 'package:flutter/material.dart';

class Product {
  final String image, subImage, title, description, type, size, id;
  final int price;

  Product(this.title, this.description, this.price, this.size, this.id, this.type, this.image, this.subImage,);
}

List<Product> products = [
  Product(
    "Office Code",
    "dummyText",
    234, "12", "1",
    "",
    "assets/images/bag_1.png",
    ""
  ),
  Product(
    "Belt Bag",
    "dummyText",
    182, "10", "2",
    "",
    "assets/images/bag_2.png",
    ""
  ),
  Product(
    "Black Bag",
    "dummyText",
    254, "14", "3",
    "",
    "assets/images/bag_3.png",
    ""
  ),
  Product(
    "Brown Bag",
    "dummyText", 277, "12", "4",
    "",
    "assets/images/bag_4.png",
    ""
  ),
  Product(
    "Red Bag",
    "dummyText",
    211, "12", "5",
    "",
    "assets/images/bag_5.png",
    ""
  ),
  Product(
    "Dark Grey Bag",
    "dummyText",
    302, "11", "6",
    "",
    "assets/images/bag_6.png",
    ""
  )
];

Color productColor(String type) {
  Color color;
  switch(type) {
    case "armored": color = Color(0xFF2E441F); break;
    case "air": color = Color(0xFFAAAAAA); break;
    case "ship": color = Color(0xFF152179); break;
    default: color = Colors.blueGrey; break;
  }

  return color;
}