import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}   //runApp 함수로 앱 실행, MyApp 위젯 실행

class MyApp extends StatelessWidget {   //MyApp이 StatelessWidget를 상속받기
  @override
  Widget build(BuildContext context) {
    return MaterialApp(         //앱 구조 설정
      home: CounterScreen(),    //메인화면 지정
    );
  }
}

class CounterScreen extends StatefulWidget {  
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pressed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
