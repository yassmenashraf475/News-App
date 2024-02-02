import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/categories/categories.dart';
import 'package:news_app/modules/home/home_screen.dart';
import 'package:news_app/modules/saved_news/saved_news_screen.dart';
import 'package:news_app/models/categorymodels.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  List<Widget> screens=[
    HomeScreen(),
    CategoriesScreen(),
    Saved_News_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:
      DotNavigationBar(
        boxShadow: [
          BoxShadow(color:  const Color(0xFF00796B),
              spreadRadius: 0.25,
            blurStyle: BlurStyle.solid
          )
        ],
          //type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00796B),
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items:[
            DotNavigationBarItem(
              icon: Icon(
                Icons.library_books_outlined,
              ),
              //label: 'News',
            ),
            DotNavigationBarItem(
              icon: Icon(
                Icons.apps_outlined,
              ),
             // label: 'Categories',
            ),
            DotNavigationBarItem(
              icon: Icon(
                Icons.bookmark_outline_rounded,
              ),
              //label: 'Saved',
            ),
          ],
      ),
    );
  }
}
