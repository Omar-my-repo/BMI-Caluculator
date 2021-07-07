import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  final String title;
  const MyCustomText({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
