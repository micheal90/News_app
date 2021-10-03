import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Screens/bottom_nav_bar.dart';
import 'package:news_app/providers/business_provider.dart';
import 'package:news_app/providers/main_provider.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/providers/sport_provider.dart';
import 'package:news_app/providers/technology_provider.dart';
import 'package:news_app/shared/components/theme_app.dart';
import 'package:news_app/shared/services/local/cache_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
          value: MainProvider()..getSharedData('isDark')),
      ChangeNotifierProvider.value(
          value: BusinessProvider()..fetchBusinessArticles()),
      ChangeNotifierProvider.value(
          value: TechnologyProvider()..fetchTechnologyArticles()),
      ChangeNotifierProvider.value(
          value: SportProvider()..fetchSportArticles()),
      ChangeNotifierProvider.value(value: SearchProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, valueMain, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeApp.themeLight,
        darkTheme:ThemeApp.themeDark ,
        themeMode: valueMain.isDark ? ThemeMode.dark : ThemeMode.light,
        home: BottomNavBar(),
      ),
    );
  }
}
