import 'package:firebase_core/firebase_core.dart';

import 'main/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/constraints.dart';

Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAdlstNDemqUaKumk6YNJue9uS1sCY88eE",
        appId: "1:834179562996:android:ade7a5b8a7df9e34db4da1",
        messagingSenderId: "834179562996",
        projectId: "shopping-7172e",
        storageBucket: "shopping-7172e.appspot.com"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shopping app',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MainPage()
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: topAppBar(),
      body: Body(),
    );
  }
}

AppBar topAppBar() {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(Icons.search,
          color: textLightColor,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart_outlined,
            color: textLightColor,
        ),
        onPressed: () {},
      ),
      SizedBox(width: 10)
    ],
  );
}