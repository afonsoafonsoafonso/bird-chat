import 'package:flutter/material.dart';

class EventNotification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      right: 0,
      child: new Container(
        padding: EdgeInsets.all(3),
        decoration: new BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        child: new Text(
          '99',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}