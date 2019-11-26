import 'dart:convert';
import 'dart:io';

import 'package:bird_chat/models/Message.dart';
import 'package:bird_chat/models/events.dart';
import 'package:flutter/services.dart';

class DatabaseMock {

  static Map<String, dynamic> _jsonData;

  static List<Event> events;
  static List<dynamic> messages;

  static bool inited = false;

  static initialize() async {
    String jsonString = await rootBundle.loadString('assets/mock.json');
    _jsonData = jsonDecode(jsonString);

    events = _parseEvents(_jsonData['Groups']);

    messages = _jsonData['Messages'];
    print('database loaded');
    inited = true;
  }

  static List<Event> _parseEvents(List<dynamic> events) {

    return events.map<Event>((json) => Event.fromJson(json)).toList();
  }

  static List<Message> _parseMessages(List<dynamic> messages) {

    return messages.map<Message>((json) => Message.fromJson(json)).toList();
  }
  
  static List<Event> getEvents() {
    return events;
  }

  static List<Message> getMessages(int eventId) {
    List<Message> msgs = List<Message>();
    for (dynamic msg in messages) {
      if (msg['groupID'] as int == eventId) {
        msgs.add(Message.fromJson(msg));
      }
    }

    return msgs;
  }
}