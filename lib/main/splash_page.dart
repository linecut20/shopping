import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping/constraints.dart';

import '../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 1500), () => Navigator.pushReplacement(context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    final String imageLogoPath = 'assets/splash_image.png';

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        //백그라운드 이미지
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imageLogoPath)
          )
        ),
        padding: EdgeInsets.all(defaultPadding),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text("ⓒ Copyright 2022, PraModel",
            style: TextStyle(
              color: textLightColor,
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}
