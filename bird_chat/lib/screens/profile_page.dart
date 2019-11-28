import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class ProfilePage extends StatelessWidget {
  ProfilePage({@required this.profileKey});

  static const String route = 'profile';

  final String profileKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
              ),
            ),
            FutureBuilder(
              future: rootBundle.loadString('assets/mock.json'),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                }
                
                var data = jsonDecode(snapshot.data);

                String name, personalURL, picURL, affiliation, bio;

                for (final person in data['People']) {
                  if (person['Key'] == this.profileKey) {
                    name = person['Name'];
                    personalURL = person['URL'];
                    picURL = person['PictureURL'];
                    affiliation = person['Affiliation'];
                    bio = person['Bio'];
                  }
                }

                _launchURL() async {
                  if (await canLaunch(personalURL)) {
                    await launch(personalURL);
                  } else {
                    throw 'Could not launch $personalURL';
                  }
                }

                return Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: double.infinity),
                      CircleAvatar(
                          radius: 85,
                          backgroundImage: NetworkImage(
                            picURL,
                            //profile.picUrl,
                            //'https://2019.programming-conference.org/getProfileImage/dariodinucci/6e954823-249a-484f-9dbf-e5462d7fa78e/small.jpg',
                          )),
                      Text(
                        name,
                        //'Dario Di Nucci',
                        //profile.name,
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bio,
                        //profile.bio,
                        //'I am a research fellow at the Software Languages Lab of the Vrije Universiteit Brussel in Belgium. I received the PhD in Management and Information Technology from the University of Salerno in 2018 advised by Prof. Andrea De Lucia with a thesis entitled Methods and Tools for Focusing and Prioritizing the Testing Effort.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 1,
                          width: 350,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        width: 350,
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 10, top: 5, bottom: 5),
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.blue,
                                      size: 35,
                                    ),
                                  ),
                                  Text(
                                    affiliation,
                                    //profile.affiliation,
                                    //'Vrije Universiteit Brussel',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: _launchURL,
                              child: Card(
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 10,
                                          top: 5,
                                          bottom: 5),
                                      child: Icon(
                                        Icons.insert_link,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                    ),
                                    Text(
                                      personalURL,
                                      //profile.url,
                                      //'http://dardin88.github.io',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
