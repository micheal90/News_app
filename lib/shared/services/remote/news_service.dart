import 'dart:convert';

import 'package:news_app/models/articale_model.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  var client = http.Client();

  Future<List<Article>> fetchSearchArticles(String value) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$value&apiKey=$ApiKey');
    try {
      http.Response response = await client.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        Articles articles = Articles.fromJson(jsonDecode(data));
        //print(articles.articles[0]);
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();

        return articleList;
      } else {
        print('Status Code =${response.statusCode}');
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$ApiKey');
    try {
      http.Response response = await client.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        //print(data);
        var articles = Articles.fromJson(jsonDecode(data));
        List<Article> articleList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        //print(articleList.length);
        return articleList;
      } else {
        print('Status Code =${response.statusCode}');
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
