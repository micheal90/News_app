import 'package:flutter/cupertino.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/shared/services/remote/news_service.dart';

class TechnologyProvider with ChangeNotifier {
  List<Article> _technologyArticlesList = [];
  List<Article> get technologyArticlesList => _technologyArticlesList;
  bool _isLoading = false;
bool get isLoading => _isLoading;

  Future fetchTechnologyArticles() async {
    _isLoading = true;
    _technologyArticlesList =
        await NewsApi().fetchArticlesByCategory('technology');
    _isLoading = false;
    notifyListeners();
  }
}
