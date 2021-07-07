import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final  onTab;
  final Icon icon;

  const CircularAvatar({Key? key, required this.icon, required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        child: icon,
        radius: 20,
      ),
      onTap: onTab,
    );
  }
}
