import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/tag.dart';

class EventDropDownContainer extends StatelessWidget {

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Text(
              'Starts: 15:30h - 29/10/2019',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 10),
            child: Text(
              'General description of what a group is. Long enough to see it flex.'
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 20, left: 10),
            child: Wrap(
              spacing: 10,
              children: <Widget> [
                new Tag(),
                new Tag(),
                new Tag(),
                new Tag(),
                new Tag(),
                new Tag(),
                new Tag(),
              ],
            ),
          ),
        ]
      ),
    );
  }
}