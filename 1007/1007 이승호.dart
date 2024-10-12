import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;
    double result;

    if (operator == '+') {
      result = num1 + num2;
    } else if (operator == '-') {
      result = num1 - num2;
    } else {
      result = 0;
    }

    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first number',
              ),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('-'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '= $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
