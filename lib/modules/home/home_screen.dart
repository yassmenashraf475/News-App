import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/modules/details/details_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/constant.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles=[];

  @override
  void initState(){
    super.initState();
    getData();
  }

  Future<List<Article>> getData()async {
    articles = await DioHelper().getNews(
        path: ApiConstants.baseUrl + ApiConstants.newEndpoint,
        queryparameters: {"apiKey": ApiConstants.apikey, "country": "us"}
    );
    //articles = Article.convertToArticles(articleslist);
    //setState(() {});
    return articles;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 20.0),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0
            ), // Adjust the padding as needed
            color: Colors.white,
            child: AppBar(
              titleSpacing: 60,
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading:DefaultFloatingButtonsec(icons:  Icons.notes),
              title: Row(
                children: [
                  defaultText(
                      fontsize: 20,
                      text: 'News',
                      colortext: Colors.black
                  ),
                  defaultTextsec(
                      text: 'App'
                  ),
                ],
              ),
              actions: [
                DefaultFloatingButton(icons: Icons.mic_none),
              ],
            ),
          ),
        ),
        body: FutureBuilder<List<Article>>(
            future: getData(),
            builder: (context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          defaultTextsec(
                              text: 'Latest News',
                              colortext: Colors.black38
                          ),
                          SizedBox(
                            width: 195,
                          ),
                          Container(
                            height: 40,
                            width: 38,
                            child: Transform.scale(
                              scale: 0.50,
                              child: FloatingActionButton(
                                elevation: 0.0,
                                shape:CircleBorder(
                                  side: BorderSide(
                                    width: 1.5,
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                onPressed: () {},
                                child:Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.black45,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                           // physics: const NeverScrollableScrollPhysics(),
                           // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Article article = snapshot.data![index];
                            return buildItem(context,article);
                          },
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            height: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                ;
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              );
            }),

      ),
    );
  }
}
Widget buildItem(context, Article article)=>
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(article: article),
          ),
        );
      },
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20),
            child: Image(
              fit: BoxFit.cover,
              height: 120,
              width: 120,
              image: NetworkImage("${article.urlToImage}"),
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
                  text: "${article.title}",
                  isUpperCase: true,
                ),
                SizedBox(
                  height: 5,
                ),
                defaultText(
                    fontsize: 15,
                    text: "${article.description}",
                    colortext: Colors.black
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_add_outlined),
          ),
        ],
      ),
    );
// Widget buildItem(context, Article news)=>GestureDetector(
//   onTap: () {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DetailsScreen(),
//       ),
//     );
//   },
//   child:Container(
//     child:Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Image(
//             height: 120,
//             image: AssetImage("${news.urlToImage}"),
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               defaultText(
//                 fontsize: 15,
//                 text: "${news.title}",
//                 isUpperCase: true,
//               ),
//
//               SizedBox(
//
//                 height: 5,
//
//               ),
//
//               defaultText(
//                   fontsize: 20,
//                   text: 'Description..ramadan karerm w kol sana w ennto taypeen ya rab ekremna w wf2na ya rab',
//
//                   colortext: Colors.black
//
//               ),
//
//             ],
//
//           ),
//
//         ),
//
//         SizedBox(
//
//           width: 5,
//
//         ),
//
//         IconButton(
//
//             onPressed: () {},
//
//             icon: Icon(Icons.bookmark_add_outlined),
//
//         ),
//
//       ],
//
//     ),
//   ),
// );