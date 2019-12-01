import 'package:bird_chat/models/startTime.dart';
import 'package:bird_chat/services/backend.dart';

class Event implements Serializable{

  int id;
  String creator;
  String title;
  String location;
  StartTime startTime;
  String description;
  List<String> tags;
  List<String> attendees;
  String startTimeString;
  
  Event({this.id, this.creator, this.title, this.location, this.startTime, this.description, this.tags, this.attendees});

  factory Event.fromJson(Map<String,dynamic> json) {
    return Event (
      id: json['id'] as int,
      creator: json['creator'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      startTime: StartTime.fromJson(
        json['startTime']
      ),
      description: json['description'] as String,
      tags: _parseTags(json['tags']),
      attendees: _parseAttendees(json['attendees'])
    );
  }

  static List<String> _parseAttendees(List<dynamic> attendes) {
    List<String> list = List<String>.from((attendes));

    return list;
  }

  static List<String> _parseTags(tagsJson) {

    List<String> tagsList = new List<String>.from((tagsJson));

    return tagsList;
  }

  @override
  Map<String, dynamic> toJson() =>
    {
      'id' : id,
      'creator' : creator,
      'title' : title, 
      'location' : location,
      'starttime': startTimeString,
      'description' : description,
      'tags' : tags,
    };
}

