import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bird_chat/models/events.dart';


class HomePageService {

  static String url = "https://api.myjson.com/bins/a6em2";

  static Future<List<Event>> getEvents() async {

    try {
      final response = await http.get(url);

      if(response.statusCode == 200) {
        List<Event> list = parseEvents(response.body);

        return list;
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static List<Event> parseEvents(String responseBody) {

    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }
}

