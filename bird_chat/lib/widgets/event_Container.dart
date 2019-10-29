import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/tag.dart';

class EventContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _EventContainer();
  }
}

class _EventContainer extends State<EventContainer> {

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 7, top: 7, bottom: 7),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Titulo da conversa so que grande o suficiente',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text('Local da conversa igualmente grande'),
                    ),
                  ],
                ),
              ),
              Container(
                child: new IconButton(
                  icon: Icon(
                    isOpen? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                  ),
                  onPressed: () {
                    setState(() {
                      if(isOpen)
                        isOpen = false;
                      else 
                        isOpen = true;
                    });
                  }
                ),
              )
            ]
          ),
          Visibility(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.white),
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
                      'General description of what a group is. Not that long, not that small, just right. Like yo momma!'
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
            ),
            visible: isOpen? true : false,
          ),
        ]
      )
    );
  }
}