import 'package:bird_chat/models/date.dart';
import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/models/startTime.dart';
import 'package:bird_chat/models/time.dart';
import 'package:flutter/material.dart';
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
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            //Title
            Text(event.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            //Title location
            Text(event.location,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Text(eventDateSring(event.startTime),
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
            //PeopleList(),
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
  const PeopleList({
    Key key,
  }) : super(key: key);

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {

  bool loading = true;
  Widget listWidget = Center(child: CircularProgressIndicator(),);

  Future<Widget> getCardsWidget() {
    List<Widget> texts = <Widget>[];

    for (var i = 0; i < 100; i++) {
      texts.add(
        InkWell(
          onTap: () {Navigator.pushNamed(context, "profile");},
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.people),
                Container(
                  margin: EdgeInsets.only(
                    left: 10
                  ),
                  child: Text(
                    "person name"
                  ),
                )
              ],
            ),
          ),
        )
      );
    }

    return Future(()=>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
    ));
  }

  void getCards() async {
    Widget widget = await getCardsWidget();
    setState(() {
      listWidget = widget;
    });
    loading = false;
  }

  bool peopleVisible = false;

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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Text("num people"),
                )
              ),
              peopleVisible ? Icon(Icons.arrow_downward) : Icon(Icons.arrow_forward)
            ],
          ),
          onTap: () {
            setState(() {
              peopleVisible = !peopleVisible;
              if (loading) {
                getCards();
              }
            });  
          },
        ),
        Visibility(
          visible: peopleVisible,
          child: listWidget,
        )
      ],
    );
  }
}