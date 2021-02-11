import 'package:flutter/material.dart';
import 'package:tradaruprojecttest/view/detail_page.dart';
import 'package:tradaruprojecttest/view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Color(0xFFf8e1eb)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child : HomePage(),
        ),
      )
    );
  }
}

