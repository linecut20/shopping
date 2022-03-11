import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/constraints.dart';
import '../model/product.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({
    required this.product,
    Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int itemCount = 1;

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

                    //상품 상세 및 수량
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.1),
                          Text("Size", style: TextStyle(color: Colors.black54)),
                          Text("${widget.product.size} cm",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(widget.product.description, style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (itemCount > 1) itemCount--;
                                    });
                                  },
                                  child: Icon(Icons.remove, color: Colors.black54),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)
                                ),
                                child: Text(itemCount.toString().padLeft(2, "0")),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      itemCount++;
                                    });
                                  },
                                  child: Icon(Icons.add, color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                    )
                                  ),
                                  child: Icon(Icons.add_shopping_cart_outlined, color: Colors.blue),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),

                              //구매버튼튼
                             Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)
                                      )
                                    ),
                                    onPressed: () {},
                                    child: Text("바로 구매", style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    )),
                                  ),
                                ),
                              )
                            ],
                          )
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
                      Text("${widget.product.title}",
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
                      Text("\$${widget.product.price}",
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
                  child: Image.asset(widget.product.image,
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
