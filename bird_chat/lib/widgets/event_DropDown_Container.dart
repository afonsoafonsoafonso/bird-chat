import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDropDownContainer extends StatelessWidget {

  final DateTime startTime;
  final String description;

  EventDropDownContainer({this.startTime, this.description});

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
              _eventStartTimeString(startTime),
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
          )
        ]
      ),
    );
  }

  String _eventStartTimeString(DateTime startTime) {
    DateFormat format = DateFormat("HH:mm'h' = dd/MM/yyyy");
    return "Starts: " + format.format(startTime);
  }
}