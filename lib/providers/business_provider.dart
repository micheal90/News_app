import 'package:flutter/cupertino.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/shared/services/remote/news_service.dart';

class BusinessProvider with ChangeNotifier {
  List<Article> _businessArticlesList = [];
  List<Article> get businessArticlesList => _businessArticlesList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future fetchBusinessArticles() async {
    _isLoading = true;
    _businessArticlesList = await NewsApi().fetchArticlesByCategory('business');
    _isLoading = false;
    notifyListeners();
  }
}
