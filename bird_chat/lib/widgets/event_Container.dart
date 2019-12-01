import 'package:bird_chat/screens/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/event_DropDown_Container.dart';

import 'package:bird_chat/models/events.dart';

class EventContainer extends StatefulWidget {

  final Event event;

  const EventContainer({this.event});

  @override
  State<StatefulWidget> createState() {
    return _EventContainer();
  }
}

class _EventContainer extends State<EventContainer> {


  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card (
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Expanded (
                flex: 7, 
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ChatPage.route, arguments: widget.event);
                    },
                    child: Container (
                    height: 50,
                    padding: EdgeInsets.only(left: 7, top: 7, bottom: 7),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Flexible (
                            child: Text(
                              widget.event.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ) 
                        ),
                        Container(
                          child: Text(
                            widget.event.location,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ],
                    ),
                  ),
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
            child: new EventDropDownContainer(
              startTime: widget.event.startTime,
              description: widget.event.description,
              tags: widget.event.tags
            ),
            visible: isOpen? true : false,
          ),
        ]
      )
    );
  }
}