import 'package:flutter/material.dart';

class Product {
  final String image, subImage, title, description, type, size, id;
  final int price;

  Product(this.title, this.description, this.price, this.size, this.id, this.type, this.image, this.subImage,);
}

Color productColor(String type) {
  Color color;
  switch(type) {
    case "armored": color = Color(0x7768B80D); break;
    case "air": color = Color(0xFFAAAAAA); break;
    case "ship": color = Color(0x744159C6); break;
    default: color = Colors.blueGrey; break;
  }

  return color;
}