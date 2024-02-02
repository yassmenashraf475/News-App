class Article{
  // final List source;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    // required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
  });

  static List<Article> convertToArticles(List articles){
    List<Article> articlesList =[];

    for(var article in articles){
      if(article["author"]==null
      ||article["title"]==null||article["description"]==null
      ||article["urlToImage"]==null||article["publishedAt"]==null
      ||article["content"]==null
      ){
        continue;
      }
      articlesList.add(
          Article(
            // source:article["source"],
            author:article["author"],
            title:article["title"],
            description:article["description"],
            urlToImage:article["urlToImage"],
            publishedAt:article["publishedAt"],
            content:article["content"],
          )
      );
    }
    return articlesList;
}
}



// import 'package:flutter/material.dart';
//
// class Articles {
//   List<Article> articles = [];
//   Articles.fromJson(Map<String,dynamic> json){
//     json["articles"].forEach((element){
//       articles.add(Article.fromJson(element));
//     });
//   }
// }
//
// class Article {
//   String? source;
//   String? author;
//   String? title;
//   String? description;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;
//
//   Article.fromJson(Map<String, dynamic> json){
//     source=json["source"];
//     author=json["author"];
//     title=json["title"];
//     description=json["description"];
//     urlToImage=json["urlToImage"];
//     publishedAt=json["publishedAt"];
//     content=json["content"];
//   }
// }