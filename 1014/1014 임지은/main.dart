import 'package:u_and_i/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'sunflower', // 기본 글씨체
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.white, //  글 색상
              fontSize: 80.0, //  글 크기
              fontWeight: FontWeight.w700, //  글 두께
              fontFamily: 'parisienne', //  글씨체
            ),
            displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )),
      home: HomeScreen(),
    );
  }
}
