import 'package:flutter/material.dart';
import 'screen/home_screen.dart'; // HomeScreen 파일을 가져옵니다

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'parisienne',
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle( // bodyText1 -> bodyLarge
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyMedium: TextStyle( // bodyText2 -> bodyMedium
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}