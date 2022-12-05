import 'package:first_lesson_fintek/page/home.dart';
import 'package:flutter/material.dart';

import 'model/travel.dart';

void main() {
  runApp(MyApp());
}

List<Travel> favoriteTravel = [];

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel',
      debugShowCheckedModeBanner: false,
      home: HomePage( favoriteTravel),
    );
  }
}
