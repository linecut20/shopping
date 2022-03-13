import 'package:firebase_storage/firebase_storage.dart' as firebase;
import 'package:flutter/material.dart';

final storage = firebase.FirebaseStorage.instance;

Future<String> downloadURL(String image) async{
  return (await storage.ref().child(image).getDownloadURL());
}

class storageImageMaker extends StatelessWidget {
  String image;
  double width;

  storageImageMaker({
    required this.image,
    required this.width,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: downloadURL(image),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return Image.network(snapshot.requireData,
            width: width,
            fit: BoxFit.fitWidth,
          );
        else
          return Container();
      },
    );
  }
}

class storageSubImageMaker extends StatelessWidget {
  String image;

  storageSubImageMaker({required this.image,
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: downloadURL(image),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return Image.network(snapshot.requireData);
        else
          return Container(height: 400);
      },
    );
  }
}