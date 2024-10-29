import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.data});
  String data;
  @override
  Widget build(BuildContext context) {
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
              backgroundColor: const Color.fromARGB(255, 149, 149, 149),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))))),
    );
  }
}
