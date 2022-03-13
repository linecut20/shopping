import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/constraints.dart';
import '../firebase_storage.dart';
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
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              //가격
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Text("Price", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              SizedBox(height: 3),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Text(NumberFormat("###,###,###").format(widget.product.price),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              SizedBox(height: 10),

              //하단부
              Container(
                padding: EdgeInsets.all(defaultPadding),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    //상품명
                    Text("${widget.product.title}",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),
                    //사이즈
                    Text("Size", style: TextStyle(color: Colors.black54, fontSize: 16)),
                    Text("${widget.product.size} cm",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(widget.product.description, style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 20),
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
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        //카트버튼
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

                        //바로구매 버튼
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
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    //서브이미지
                    storageSubImageMaker(image: widget.product.subImage)
                  ],
                ),
              ),
            ],
          ),

          //상품이미지
          Positioned(
            right: size.width * 0.09,
            top: size.height * 0.05,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 2
                )
              ),
              child: storageImageMaker(image: widget.product.image, width: size.width * 0.45)
            ),
          )
        ],
      ),
    );
  }
}
