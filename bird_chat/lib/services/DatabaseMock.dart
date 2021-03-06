import 'dart:convert';

import 'package:bird_chat/models/Message.dart';
import 'package:bird_chat/models/User.dart';
import 'package:bird_chat/models/events.dart';
import 'package:flutter/services.dart';

class DatabaseMock {

  static Map<String, dynamic> jsonData;

  static List<Event> events;
  static Map<String, User> usersMap;
  static List<Message> messages;
  static int lastEventId = 9999;

  static bool inited = false;

  static initialize() async {
    String jsonString = await rootBundle.loadString('assets/mock.json');
    jsonData = jsonDecode(jsonString);

    events = _parseEvents(jsonData['Groups']);

    usersMap = _parseUsers(jsonData['People']);

    messages = _parseMessages(jsonData['Messages']);
    print('database loaded');
    inited = true;
  }

  static List<Event> _parseEvents(List<dynamic> events) {

    return events.map<Event>((json) => Event.fromJson(json)).toList();
  }

  static Map<String, User> _parseUsers(List<dynamic> users) {
    List<User> usersList = users.map<User>((json) => User.fromJson(json)).toList();

    Map<String, User> uMap = Map();

    usersList.forEach((user) {
      uMap[user.key] = user;
    });

    return uMap;
  }

  static List<Message> _parseMessages(List<dynamic> messages) {

    return messages.map<Message>((json) => Message.fromJson(json)).toList();
  }
  
  static List<Event> getEvents(User user, String type) {

    List<Event> newEvents = new List<Event>();
    bool isPartOf = false;

    for(var i=0; i<events.length; i++) {
      
      for(var j=0; j<events[i].attendees.length; j++) { 

        if(events[i].attendees[j] == user.key) {

          isPartOf = true; 
          break;
        }
      }

      if(type == "new") {
        if(!isPartOf) {
          newEvents.add(events[i]);
        }
      }
      else if(type == "mine") {
        if(isPartOf) {
          newEvents.add(events[i]);
        }
      }

      isPartOf = false;
    }

    return newEvents;
  }
  static void addMessage(Message msg) {
    print(msg.text);
    messages.add(msg);
  }

  static List<Message> getMessages(int eventId) {
    return messages.where((i) => i.groupID == eventId).toList();
  }

  static User getUser(String key) {
    return usersMap[key];
  }

  static void attendEvent(Event event, User user) {
    event.attendees.add(user.key);
  }

  static void addEvent(Event event){
    event.id = lastEventId;
    lastEventId++;
    events.add(event) ;
    
  }
}