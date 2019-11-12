import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bird_chat/models/events.dart';


class EventsService {

  static String homeEvents = "https://api.myjson.com/bins/a6em2";
  static String myEvents = "https://api.myjson.com/bins/18y4ca";

  static Future<List<Event>> getEvents(String typeOfEvents) async {

    try {
      var response;
      List<Event> list;

      if(typeOfEvents == 'homeEvents') {
        response = await http.get(homeEvents);
      }
      else if(typeOfEvents == 'myEvents') {
        response = await http.get(myEvents);
      }
      else {
        return list;
      }


      if(response.statusCode == 200) {
        list = parseEvents(response.body);

        return list;
      }

      return list;

    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static List<Event> parseEvents(String responseBody) {

    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }
}

