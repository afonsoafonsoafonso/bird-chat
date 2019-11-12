import 'package:bird_chat/models/time.dart';
import 'package:bird_chat/models/date.dart';

class StartTime {

  Time time;
  Date date;
  
  StartTime({this.time, this.date});

  factory StartTime.fromJson(Map<String,dynamic> json) {
    return StartTime (
      time: Time.fromJson(
        json['time']
      ),
      date: Date.fromJson(
        json['date']
      ),
    );
  }

}