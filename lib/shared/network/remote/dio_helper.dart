import 'package:dio/dio.dart';
import 'package:news_app/models/articles.dart';
class DioHelper{
  final Dio dio=Dio();

  Future<List<Article>> getNews({
    required String path,
    required Map<String,dynamic> queryparameters
  })async{
    Response response =await dio.get(path,queryParameters: queryparameters);
    List articlelist;
    articlelist=response.data["articles"];
     List<Article> articles=Article.convertToArticles(articlelist);
    return articles;
  }
}


// class DioHelper {
//   static Dio dio = Dio();
//   static Future<Response> getData({
//     required String url,
//     required Map<String, dynamic> query,
//   }) async{
//     return await dio.get(url, queryParameters: query);
//   }
// }