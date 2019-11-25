import 'package:bird_chat/models/startTime.dart';

class Event {

  String title;
  String location;
  StartTime startTime;
  String description;
  List<String> tags;
  
  Event({this.title, this.location, this.startTime, this.description, this.tags});

  factory Event.fromJson(Map<String,dynamic> json) {
    return Event (
      title: json['title'] as String,
      location: json['location'] as String,
      startTime: StartTime.fromJson(
        json['startTime']
      ),
      description: json['description'] as String,
      tags: parseTags(json['tags']) 
    );
  }

  static List<String> parseTags(tagsJson) {

    List<String> tagsList = new List<String>.from((tagsJson));

    return tagsList;
  }


  save(){
    
  }

}

