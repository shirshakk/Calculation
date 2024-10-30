import 'package:calculator/Widget/Display.dart';
import 'package:calculator/Widget/button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/DummyData/Dummydata.dart';

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
                    onPressed: _updateInputValue,
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
