import 'package:bird_chat/services/DatabaseMock.dart';
import 'package:bird_chat/services/Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:bird_chat/main.dart' as app;

void main() async {
  enableFlutterDriverExtension();

  await DatabaseMock.initialize();

  Session.setCurrentUser("coiso");

  runApp(app.BirdChatApp());
}