import 'package:flutter/material.dart';
import 'package:bird_chat/screens/home.dart';

void main() {

  runApp(
    MaterialApp(
      title: 'Bird Chat',
      debugShowCheckedModeBanner: false,
      home: new Home(),
    )
  );
}