import 'package:flutter/material.dart';
import 'package:news_app/Screens/bussiness-articles_screen.dart';
import 'package:news_app/Screens/search_screen.dart';
import 'package:news_app/Screens/sport_articles_screen.dart';
import 'package:news_app/Screens/technology_articles_screen.dart';
import 'package:news_app/providers/main_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Map<String, dynamic>> _pages = [
    {
      'title': 'Business',
      'page': BusinessArticlesScreen(),
    },
    {
      'title': 'Technology',
      'page': TechnologyArticlesScreen(),
    },
    {
      'title': 'Sports',
      'page': SportArticlesScreen(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SearchScreen())),
              icon: Icon(Icons.search)),
          IconButton(
            onPressed: () => Provider.of<MainProvider>(context, listen: false)
                .changeThemeMode(),
            icon: Icon(
              Icons.brightness_4_outlined,
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _changeIndex(index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(
              icon: Icon(Icons.developer_board), label: 'Technology'),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
        ],
      ),
    );
  }
}
