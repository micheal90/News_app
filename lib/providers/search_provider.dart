import 'package:flutter/cupertino.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/shared/services/remote/news_service.dart';

class SearchProvider with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => _articles;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future fetchSerachArticles(String value) async {
    _isLoading = true;
    _articles = await NewsApi().fetchSearchArticles(value);

    _isLoading = false;
    notifyListeners();
  }

  void clearList() {
    _articles.clear();
    notifyListeners();
  }
}
