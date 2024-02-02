import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/modules/categories/categories.dart';
import 'package:news_app/modules/details/details_screen.dart';
import 'package:news_app/modules/home/home_screen.dart';
import 'package:news_app/modules/saved_news/saved_news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}

