import 'package:flutter/material.dart';

class Tag extends StatelessWidget {

  final String tagName;

  Tag({this.tagName});

  @override
  Widget build(BuildContext context) {

    return Text(
      '#' + 
      this.tagName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}