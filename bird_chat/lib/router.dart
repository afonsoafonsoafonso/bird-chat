import 'package:bird_chat/models/date.dart';
import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/models/startTime.dart';
import 'package:bird_chat/models/time.dart';
import 'package:bird_chat/screens/GroupInfoPage.dart';
import 'package:bird_chat/screens/home.dart';
import 'package:bird_chat/screens/ChatPage.dart';
import 'package:bird_chat/screens/profile_page.dart';
import 'package:bird_chat/services/MessagesController.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/screens/CreatePage.dart';
import 'package:bird_chat/screens/UndefinedView.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home.route:
      return MaterialPageRoute(builder: (context) => Home());
    case CreatePage.route:
      return MaterialPageRoute(builder: (context) => CreatePage());
    case ChatPage.route:
      Event optional = new Event(
        id: 0,
        creator: "user",
        title: "Event Title",
        description: "A thing where we talk and stuff",
        location: "place",
        startTime: StartTime(
            date: Date(day: 1, month: 1, year: 1970),
            time: Time(hours: 0, minutes: 0)),
        tags: <String>["TagA, TagB"],
      );
      return MaterialPageRoute(
          builder: (context) => ChatPage(
                event: optional,
                controller: MessagesController(event: optional),
              ));

    case GroupInfoPage.route:
      Event optional = new Event(
        id: 0,
        creator: "user",
        title: "Event Title",
        description: "A thing where we talk and stuff",
        location: "place",
        startTime: StartTime(
            date: Date(day: 1, month: 1, year: 1970),
            time: Time(hours: 0, minutes: 0)),
        tags: <String>["TagA, TagB"],
      );

      return MaterialPageRoute(
          builder: (context) => GroupInfoPage(event: optional));
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
