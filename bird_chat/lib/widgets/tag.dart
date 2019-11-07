import 'package:flutter/material.dart';

class Tag extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Text(
      '#TagX',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}