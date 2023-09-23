import 'package:flutter/material.dart';
import 'package:meals/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, brightness: Brightness.dark),
      ),
      home: HomePage(),
    );
  }
}
