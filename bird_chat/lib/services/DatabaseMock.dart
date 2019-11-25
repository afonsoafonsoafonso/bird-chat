import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class DatabaseMock {

  static Map<String, dynamic> _jsonData;

  static initialize() {
    rootBundle.loadString('assets/mock.json').then((string) {
      _jsonData = json.decode(string);
      print('database loaded');
    });
  }
  
}