import 'package:flutter/material.dart';

class Product {
  final String image, subImage, title, description, type;
  final int price, size, id;
  final Color color;

  Product(this.image, this.title, this.description, this.price, this.size, this.id, this.color, this.type, this.subImage);
}

List<Product> products = [
  Product(
    "assets/images/bag_1.png",
    "Office Code",
    "dummyText",
    234, 12, 1, const Color(0xff3d82ae),
    "",
    ""
  ),
  Product(
    "assets/images/bag_2.png",
    "Belt Bag",
    "dummyText",
    182, 10, 2, const Color(0xffd29143),
    "",
    ""
  ),
  Product(
    "assets/images/bag_3.png",
    "Black Bag",
    "dummyText",
    254, 14, 3, const Color(0xFF2A2A2A),
    "",
    ""
  ),
  Product(
    "assets/images/bag_4.png",
    "Brown Bag",
    "dummyText",
    277, 12, 4, const Color(0xffd0862d),
    "",
    ""
  ),
  Product(
    "assets/images/bag_5.png",
    "Red Bag",
    "dummyText",
    211, 12, 5, const Color(0xE9D92929),
    "",
    ""
  ),
  Product(
    "assets/images/bag_6.png",
    "Dark Grey Bag",
    "dummyText",
    302, 11, 6, const Color(0xFF393939),
    "",
    ""
  )
];

Color productColor(String type) {
  Color color;
  switch(type) {
    case "tank": color = Colors.green; break;
    case "armored_vehicle": color = Colors.lightGreen; break;
    case "air": color = Colors.blue; break;
    case "navy": color = Colors.indigo; break;
    default: color = Colors.blueGrey; break;
  }

  return color;
}