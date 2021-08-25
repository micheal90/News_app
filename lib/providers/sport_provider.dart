import 'package:flutter/cupertino.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/shared/services/remote/news_service.dart';

class SportProvider with ChangeNotifier {
  List<Article> _sportArticlesList = [];
  List<Article> get sportArticlesList => _sportArticlesList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future fetchSportArticles() async {
    _isLoading = true;
    _sportArticlesList = await NewsApi().fetchArticlesByCategory('sport');
    _isLoading = false;
    notifyListeners();
  }
}
