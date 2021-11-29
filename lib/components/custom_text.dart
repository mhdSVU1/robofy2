import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CustomText()));
}

class CustomText extends StatelessWidget {
  CustomText({this.text, this.color, this.size, this.font, this.action});

  final text;
  final color;
  final size;
  final font;
  final action;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: action == null
            ? Text(
          text,
          style: TextStyle(
            color: color ?? Colors.pink,
            fontSize: size ?? 18.0,
            fontWeight: font ?? FontWeight.bold,
          ),
        )
            : TextButton(
          child: Text(
            text??"",
            style: TextStyle(
              color: color ?? Colors.pink,
              fontSize: size ?? 18.0,
              fontWeight: font ?? FontWeight.bold,
            ),
          ),
          onPressed: action,
        ));
  }
}
