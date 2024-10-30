import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String inputValue;

  const Display({super.key, required this.inputValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                inputValue,
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
