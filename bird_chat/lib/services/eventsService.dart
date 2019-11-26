import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:bird_chat/models/events.dart';

class EventsService {

  static Future<List<Event>> getEvents() async {

    List<Event> list;

    String jsonString = await rootBundle.loadString('assets/mock.json');
    var jsonData = jsonDecode(jsonString);

    list = parseEvents(jsonData["Groups"]);

    return list;
  }

  static List<Event> parseEvents(List<dynamic> events) {

    return events.map<Event>((json) => Event.fromJson(json)).toList();
  }
}

