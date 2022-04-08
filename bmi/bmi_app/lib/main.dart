import 'package:flutter/material.dart';
import 'home.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
          headline3: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
          headline2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
