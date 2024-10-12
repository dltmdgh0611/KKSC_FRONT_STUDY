import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ElevatedButton Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ElevatedButton Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // 버튼이 눌렸을 때 실행되는 코드
              print("Button Pressed!");
            },
            child: Text('눌렸습니다.'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
