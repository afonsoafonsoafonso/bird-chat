import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/home_body.dart';
import 'package:bird_chat/widgets/myEvents_body.dart';
import 'package:bird_chat/widgets/event_notification.dart';
import 'CreatePage.dart';class Home extends StatefulWidget {

static const String route = '/';

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  String page = "Home";

  Widget pageBody = new HomeBody();

  final topBar = new AppBar(
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
    elevation: 1.0,
    title: SizedBox(
      height: 35.0,
      child: Image.asset("assets/images/flock_logo.png")
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: pageBody,
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        child: new BottomAppBar(
          child: new Row(
            // alignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  setState(() {

                    if(page == "Home") {
                      return;
                    }

                    page = "Home";
                    pageBody = new HomeBody();
                    
                  });
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
              new Stack(
                children: <Widget>[
                  new IconButton(
                    icon: Icon(
                      Icons.event,
                    ),
                    onPressed: () {
                      setState(() {

                        if(page == "MyEvents") {
                          return;
                        }

                        page = "MyEvents";
                        pageBody = new MyEventsBody();

                      });
                    },
                  ),
                  new EventNotification(),
                ]
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add
        ),
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.route);
        },
        tooltip: 'Create New Group',
      ),
    );
  }
}