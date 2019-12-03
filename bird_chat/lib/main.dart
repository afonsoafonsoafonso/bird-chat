import 'package:bird_chat/screens/HomePage.dart';
import 'package:bird_chat/services/DatabaseMock.dart';
import 'package:bird_chat/services/Session.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() async {

  await DatabaseMock.initialize();

  Session.setCurrentUser("coiso");

  runApp(
    MaterialApp(
      title: 'Bird Chat',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: Home.route,
    )
  );
}
