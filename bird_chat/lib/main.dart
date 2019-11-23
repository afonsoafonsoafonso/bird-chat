import 'package:flutter/material.dart';
import 'package:bird_chat/screens/home.dart';
import 'router.dart' as router;

void main() {

  runApp(
    MaterialApp(
      title: 'Bird Chat',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: Home.route,
    )
  );
}
