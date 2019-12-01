import 'dart:convert';

import 'package:bird_chat/models/User.dart';
import 'package:bird_chat/models/date.dart';
import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/models/startTime.dart';
import 'package:bird_chat/models/time.dart';
import 'package:bird_chat/screens/profile_page.dart';
import 'package:bird_chat/services/DatabaseMock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GroupInfoPage extends StatelessWidget {
  static const String route = "/groupinfo";

  final Event event;

  GroupInfoPage({this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Info"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Creator Profile"),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, ProfilePage.route,
                    arguments: event.creator);
              },
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            //Title
            Text(
              event.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            //Title location
            Text(
              event.location,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Text(
              eventDateSring(event.startTime),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Text(event.description),
            Divider(
              thickness: 1,
            ),
            PeopleList(
              event: event,
            ),
          ],
        ),
      ),
    );
  }

  String eventDateSring(StartTime startTime) {
    Date date = startTime.date;
    Time time = startTime.time;

    return "${date.day}/${date.month}/${date.year} ${time.hours}:${time.minutes}";
  }
}

class PeopleList extends StatefulWidget {
  final Event event;

  const PeopleList({
    this.event,
    Key key,
  }) : super(key: key);

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  bool peopleVisible = false;

  List<String> attendees;
  Future<List<Widget>> widgets;

  @override
  void initState() {
    super.initState();

    attendees = widget.event.attendees;

    widgets = _getEventUsers();
  }

  Future<List<Widget>> _getEventUsers() async {
    List<Widget> widgets = <Widget>[];

    for (String key in attendees) {

      User user = DatabaseMock.getUser(key);

      widgets.add(
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProfilePage.route, arguments: key);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.person),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(user.name),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("${attendees.length} people."),
                )
              ),
              peopleVisible
                  ? Icon(Icons.arrow_downward)
                  : Icon(Icons.arrow_forward)
            ],
          ),
          onTap: () {
            setState(() {
              peopleVisible = !peopleVisible;
            });
          },
        ),
        Visibility(
          visible: peopleVisible,
          child: FutureBuilder(
            future: widgets,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
