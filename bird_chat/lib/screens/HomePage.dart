import 'package:bird_chat/screens/ChatPage.dart';
import 'package:bird_chat/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/widgets/home_body.dart';
import 'package:bird_chat/widgets/myEvents_body.dart';
import 'CreatePage.dart';

class Home extends StatefulWidget {
  static const String route = '/';

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  String page = "Home";

  Widget pageBody = new HomeBody();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(page),
        elevation: 1.0
      ),
      body: pageBody,
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.07,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  setState(() {
                    if (page == "Home") {
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
                        if (page == "My Events") {
                          return;
                        }

                        page = "My Events";
                        pageBody = new MyEventsBody();
                      });
                    },
                  ),
                ]
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.route);
        },
        tooltip: 'Create New Group',
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Afonso Afonso Afonso"),
              accountEmail: Text("AfonsoAfonsoAfonso@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
                title: Text('My Profile'),
                onTap: () {
                  //Navigator.pop(context);
                  //filler until we have profile app
                  //Navigator.pushNamed(context, ProfilePage.route);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(profileKey: 'dariodinucci')));
                }),
            ListTile(
                title: Text('Example Chat'),
                onTap: () {
                  Navigator.pop(context);
                  //filler until we have profile app
                  Navigator.pushNamed(context, ChatPage.route);
                })
          ],
        ),
      ),
    );
  }
}
