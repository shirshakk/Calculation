import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.data, required this.index});
  String data;
  int index;
  @override
  Widget build(BuildContext context) {
    var _buttonColor = Color.fromARGB(255, 149, 149, 149);
    if (index % 4 == 0) {
      _buttonColor = Colors.blue;
    }
    return Container(
      height: 20,
      width: 20,
      child: TextButton(
          onPressed: () {},
          child: Text(
            data,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          style: TextButton.styleFrom(
              backgroundColor: _buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))))),
    );
  }
}
