import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/models/categorymodels.dart';
import 'package:news_app/modules/categories/articles_category.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/constant.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class CategoriesScreen extends StatefulWidget {
   CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Article> articles=[];

  List<CategoriesModel> categories=[
    CategoriesModel(
      imagePath: 'assests/images/How To Organize E-Mail Folders - Damsel In Dior.jpg',
      text: 'Business',
    ),
    CategoriesModel(
      imagePath: 'assests/images/The Classic Comedy and Bar.jpg',
      text: 'Entertainment',
    ),
    CategoriesModel(
      imagePath: 'assests/images/Tumblr.jpg',
      text: 'General',
    ),
    CategoriesModel(
      imagePath: 'assests/images/Salmon Avocado Salad.jpg',
      text: 'Health',
    ),
    CategoriesModel(
      imagePath: 'assests/images/Vista do close-up do conceito de ciência _ Foto Grátis.jpg',
      text: 'Science',
    ),
    CategoriesModel(
      imagePath: 'assests/images/1 Full-Figured Writer Discovered Her New Favorite Sports Bra — and It’s Not What You Think.jpg',
      text: 'Sports',
    ),
    CategoriesModel(
      imagePath: 'assests/images/Evolução e Inovação na Tecnologia.jpg',
      text: 'Technology',
    ),
  ];

  //String? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20.0),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0
          ), // Adjust the padding as needed
          color: Colors.white,
          child: AppBar(
            titleSpacing: 60,
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading:DefaultFloatingButtonsec(icons:  Icons.notes),
           actions: [
              DefaultFloatingButton(icons: Icons.search_outlined),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: defaultText(
                  text: 'Categories',
                  colortext: Colors.black,
                  fontsize: 45
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 , //num of items in each row
                childAspectRatio: 1.1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) => buildItem(context
                  ,categories[index]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildItem(BuildContext context,CategoriesModel category)=>
    GestureDetector(
      onTap: () =>Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlesCategory(category: "${category.text}"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    fit: BoxFit.cover,
                    width: 200,
                    height: 155,
                    image: AssetImage("${category.imagePath}"),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "${category.text}",
                  style: TextStyle(
                      fontFamily:"fonttry",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                // Image(
                //     image: AssetImage("assests/images/download.jpg"),
                // )
              ],
      
            ),
          ],
        ),
      ),
    );