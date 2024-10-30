import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String data;
  final int index;
  final Function(String) onPressed; // Callback function

  Button(
      {super.key,
      required this.data,
      required this.index,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var _buttonColor = Color.fromARGB(255, 149, 149, 149);
    if (index % 4 == 0) {
      _buttonColor = Colors.blue;
    }

    return Container(
      height: 50,
      width: 50,
      child: TextButton(
        onPressed: () {
          onPressed(data); // Call the callback function
        },
        child: Text(
          data,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: _buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
