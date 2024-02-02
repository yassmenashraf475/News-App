import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/network/local/sqldb.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key,required this.article});
  final Article article;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Sqflite sqlDb = Sqflite();
  bool _isFavorite = false;
  List articlesList = [];
  bool isLoading = true;

  myReadData() async {
    // Shortcut
    List<Map> response = await sqlDb.myRead('article');
    articlesList.addAll(response);
    isLoading = false;
    setState(() {});
    // Call checkFavoriteStatus with the favoriteProducts list
    checkFavoriteStatus(articlesList);
  }

// Updated checkFavoriteStatus function
  Future<void> checkFavoriteStatus(List favoriteArticles) async {
    // Check if the product with the same ID exists in the favorite table
    bool isFavorite = favoriteArticles.any((favorite) =>
    favorite['name'] == widget.article.title && favorite['isColored'] == 1);

    setState(() {
      _isFavorite = isFavorite;
    });
  }
  //bool showBox = false; CHANGE AFTER API
  bool showBox = false;

  @override
  void initState() {
    myReadData();
    super.initState();
   // Load items after a delay (e.g., 2 seconds)
      Future.delayed(Duration(seconds: 2), () {
        loadItems();
      });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   // Load items after a delay (e.g., 2 seconds)
  //   Future.delayed(Duration(seconds: 2), () {
  //     loadItems();
  //   });
  // }
  void loadItems() {
    // Simulate loading items from a data source
    setState(() {
      isLoading = false;
      showBox = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: () async{
          setState(() {
            _isFavorite = !_isFavorite;
          }
          );
          if (_isFavorite) {
            await sqlDb.myInsert('article', {
              // "source": '${widget.article.source}',
              "author": '${widget.article.author}',
              "title": '${widget.article.title}',
              "description": '${widget.article.description}',
              "urlToImage": '${widget.article.urlToImage}',
              "publishedAt": '${widget.article.publishedAt}',
              "content": '${widget.article.content}',
              "isColored": 1,
            });
          } else {
            // Remove the product from favorites
            // You need to implement this part based on your database logic
            await sqlDb.myDelete('article', 'title = ${widget.article.title}');
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.bookmark_add_outlined,
          color: _isFavorite ? Colors.red : null,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()):
      Stack(
        children:[ CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 220.0,
              floating: false,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  Image(
                    image: NetworkImage("${widget.article.urlToImage}"),
                    fit: BoxFit.cover,
                    height: 300.0,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 25.0, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-10, -10),
                           blurRadius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    bottom: 16,
                    right: 16,
                    top:300,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultTextthird(
                        fontsize: 20,
                        text: '${widget.article.content}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
          // if (showBox)
            Center(
              child: Container(
                // height: 330,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultTextthird(
                        text: '${widget.article.publishedAt}',
                      fontsize: 16
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextthird(
                      fontsize: 20,
                      fontweighttext: FontWeight.bold,
                      text: '${widget.article.description}',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultTextthird(
                        text: '${widget.article.author}',
                        fontsize: 16
                    ),
                  ],
                ),
              ),
            ),
      ]
      ),
    );
  }
}
