import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Screens/bottom_nav_bar.dart';
import 'package:news_app/providers/business_provider.dart';
import 'package:news_app/providers/main_provider.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/providers/sport_provider.dart';
import 'package:news_app/providers/technology_provider.dart';
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
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xfff5edee),
                elevation: 0,
                backwardsCompatibility: false,
                titleSpacing: 8,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarColor: Color(0xfff5edee),
                )),
            //primaryColor: Color(0xfff5edee),
            primarySwatch: Colors.deepOrange,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              bodyText2: TextStyle(color: Colors.black, fontSize: 14),
            ),
            scaffoldBackgroundColor: Color(0xfff5edee),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xfff5edee),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey)),
        darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xff6e6b6d),
                elevation: 0,
                titleSpacing: 8,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Color(0xff6e6b6d),
                )),
            //primaryColor: Color(0xff6e6b6d),
            primarySwatch: Colors.deepOrange,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              bodyText2: TextStyle(color: Colors.white, fontSize: 14),
            ),
            scaffoldBackgroundColor: Color(0xff6e6b6d),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xff6e6b6d),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey)),
        themeMode: valueMain.isDark ? ThemeMode.dark : ThemeMode.light,
        home: BottomNavBar(),
      ),
    );
  }
}
