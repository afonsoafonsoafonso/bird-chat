import 'package:flutter/material.dart';
import 'package:bird_chat/screens/home.dart';
import 'package:bird_chat/widgets/home_body2.dart';

void main() {

  List<EventOverview> events = generateEvents(30);

  runApp(
    MaterialApp(
      title: 'Bird Chat',
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
  );
}
