import 'package:calculator/Widget/Display.dart';
import 'package:calculator/Widget/button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/DummyData/Dummydata.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _buttonData = Dummydata().buttonValue;
  String _inputValue = '';
  void _updateInputValue(String value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _inputValue += value;
      });
    });
  }

  void _calculateResult() {
    try {
      final result = _evaluateExpression(_inputValue);
      setState(() {
        _inputValue = result.toString();
      });
    } catch (e) {
      setState(() {
        _inputValue = 'Error';
      });
    }
  }

  double _evaluateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  void _clearInput() {
    setState(() {
      _inputValue = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Display(
                inputValue: _inputValue,
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: Dummydata().buttonValue.length,
                itemBuilder: (context, index) {
                  return Button(
                      data: _buttonData[index],
                      index: index + 1,
                      onPressed: (value) {
                        if (value == '=') {
                          _calculateResult();
                        } else if (value == 'C') {
                          _clearInput();
                        } else {
                          _updateInputValue(value);
                        }
                      });
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
