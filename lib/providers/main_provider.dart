import 'package:flutter/material.dart';
import 'package:news_app/shared/services/local/cache_helper.dart';

class MainProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void changeThemeMode() async {
    _isDark = !_isDark;
    await CacheHelper.putKey(key: 'isDark', value: _isDark);
    notifyListeners();
  }

  void getSharedData(String key) {
    _isDark = CacheHelper.getKey(key: key) ?? false;
    notifyListeners();
  }
}
