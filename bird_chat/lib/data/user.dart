import 'package:flutter/material.dart';

class User {
  User({@required this.name, this.bio, this.link, this.affiliation, this.photo});

  final String name;
  final String bio;
  final String link;
  final String affiliation;
  final String photo;
}