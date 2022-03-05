import 'body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/constraints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shopping app',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const MainPage()
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(),
      body: Body(),
    );
  }

}

AppBar topAppBar() {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/back.svg"),
      onPressed: () {},
    ),
    actions: <Widget> [
      IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg",
          color: textColor,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset("assets/icons/cart.svg",
          color: textColor,
        ),
        color: textColor,
        onPressed: () {},
      )
    ],
  );
}