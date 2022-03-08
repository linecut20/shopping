import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/constraints.dart';
import '../product.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({
    required this.product,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //총 width와 height
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                //하단부
                Positioned(
                  width: size.width,
                  height: size.height * 0.65,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)
                      )
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.1),
                          Text("Size", style: TextStyle(color: Colors.black54)),
                          Text("${product.size} cm",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(product.description, style: TextStyle(color: Colors.black54),),

                        ],
                      ),
                    ),
                  ),
                ),

                //상품명
                Positioned(
                  left: size.width * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.title}",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),

                //가격
                Positioned(
                  left: size.width * 0.05,
                  top: size.height * 0.275,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10),
                      Text("\$${product.price}",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),

                //상품 이미지
                Positioned(
                  right: size.width * 0.05,
                  top: size.height * 0.175,
                  child: Image.asset(product.image,
                    width: size.width * 0.45,
                    fit: BoxFit.fitWidth)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
