import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';

import 'armored_main_page.dart';

final List<String> categories = ["장갑차량", "전함", "항공기"];

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //상단부================
          Text("PraModel",
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor),
          ),
          Container(
            height: 25,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index)
            ),
          ),

          //중단부================
          Expanded(
            child: IndexedStack(
              index: pageIndex,
              children: [
                //1번 페이지
                ArmoredPage()
              ],
            )
          )
        ],
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: pageIndex == index ? textColor : textLightColor
              ),
            ),

            Container(
                height: 3,
                width: 40,
                color: pageIndex == index ? Colors.blueGrey : Colors.transparent
            )
          ],
        ),
      ),
    );
  }
}