import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static final themeLight = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xfff5edee),
        elevation: 0,
        titleSpacing: 8,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(color: Colors.black),
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarBrightness: Brightness.dark,
        //statusBarColor: Color(0xfff5edee),
        //)
      ),
      //primaryColor: Color(0xfff5edee),
      primarySwatch: Colors.deepOrange,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        bodyText2: TextStyle(color: Colors.black, fontSize: 14),
      ),
      scaffoldBackgroundColor: Color(0xfff5edee),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xfff5edee),
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey));

  static final themeDark = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff6e6b6d),
          elevation: 0,
          titleSpacing: 8,
          titleTextStyle: TextStyle(
            color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600
          ),
          iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Color(0xff6e6b6d),
          )),
      //primaryColor: Color(0xff6e6b6d),
      primarySwatch: Colors.deepOrange,
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(color: Colors.white, fontSize: 14),
      ),
      scaffoldBackgroundColor: Color(0xff6e6b6d),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff6e6b6d),
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey));
}
