import 'package:flutter/material.dart';
import 'package:news_app/modules/details/details_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/network/local/sqldb.dart';
import 'package:news_app/models/articles.dart';

class Saved_News_Screen extends StatefulWidget {
  const Saved_News_Screen({super.key});

  @override
  State<Saved_News_Screen> createState() => _Saved_News_ScreenState();
}

class _Saved_News_ScreenState extends State<Saved_News_Screen> {
  Sqflite sqlDb = Sqflite();
  List articleList = [];
  List<Article> articles=[];
  bool isLoading = true;

  myReadData() async {
    // List<Map<String, dynamic>>response = await sqlDb.myRead('article');
    // articleList.addAll(response);
    //
    // articles = Article.convertToArticles(articleList);

    List<Map<String, dynamic>>response = await sqlDb.myRead('article');
    articleList.addAll(response);
    isLoading = false;
    setState(() {});
  }



  @override
  void initState() {
    myReadData();
    super.initState();
  }

  void deleteItem(String itemTitle) async {
   // int response = await sqlDb.myDelete('article', 'id// = $itemTitle');
    //print(response); // Print the response for debugging
    setState(() {
      articleList.removeWhere((article) => article["title"] == itemTitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (context, index) => buildItem(articleList[index],
          sqlDb, () => deleteItem(articleList[index]["title"]),context,),
        separatorBuilder: (context, index) => SizedBox(height: 10,),
        itemCount: articles.length,
      ),
    );
  }
}

Widget buildItem(
    Map article,
    // Article article,
    Sqflite sqlDb,
    VoidCallback deleteItem,
    BuildContext context)=>
    GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsScreen(article: article),
        //   ),
        // );
      },
      child:Container(
        child:Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                image: NetworkImage(article['urlToImage']),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(
                    fontsize: 15,
                    text: article['title'],
                    isUpperCase: true,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  defaultText(
                      fontsize: 15,
                      text: article['description'],
                      colortext: Colors.black
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                deleteItem;
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
