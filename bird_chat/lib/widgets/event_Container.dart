import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/event_DropDown_Container.dart';

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
    return Card (
      child: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Expanded (
                flex: 7, 
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
                            'Titulo da conversa so que grande o suficiente ahahahah',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ) 
                      ),
                      Container(
                        child: Text(
                          'Local da conversa igualmente grande',
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
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
            child: new EventDropDownContainer(),
            visible: isOpen? true : false,
          ),
        ]
      )
    );
  }
}