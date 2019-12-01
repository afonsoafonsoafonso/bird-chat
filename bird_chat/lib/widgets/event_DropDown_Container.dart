import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/tag.dart';

import 'package:bird_chat/models/startTime.dart';

class EventDropDownContainer extends StatelessWidget {

  final StartTime startTime;
  final String description;
  final List<String> tags;

  EventDropDownContainer({this.startTime, this.description, this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black
          ),
        )
      ),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Text(
              'Starts: ' + 
              this.startTime.time.hours.toString() + 
              ':' +
              this.startTime.time.minutes.toString() +
              'h - ' +
              this.startTime.date.day.toString() +
              '/' + 
              this.startTime.date.month.toString() +
              '/' + 
              this.startTime.date.year.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 10),
            child: Text(
              this.description
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 20, left: 10),
            child: Wrap(
              spacing: 10,
              children: <Widget> [
                for(String tagName in this.tags ) new Tag(tagName: tagName)
              ],
            ),
          ),
        ]
      ),
    );
  }
}