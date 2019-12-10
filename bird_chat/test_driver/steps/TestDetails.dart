import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidget
extends Given1WithWorld<String, FlutterWorld> {

  @override
  Future<void> executeStep(String widgetName) async {
    final widget = find.byValueKey(widgetName);
    await FlutterDriverUtils.waitForFlutter(world.driver);
    await FlutterDriverUtils.isPresent(widget, world.driver);
  }

  RegExp get pattern => RegExp(r"I have {string}");
}

class CheckWhenButtonTap
extends When1WithWorld<String, FlutterWorld> {

  @override
  Future<void> executeStep(String widgetName) async {
    final widget = find.byValueKey(widgetName);
    await FlutterDriverUtils.tap(world.driver, widget);
  }

  RegExp get pattern => RegExp(r"I tap {string}");
}

class CheckThenShouldHavePage
extends Then1WithWorld<String, FlutterWorld> {

  @override
  Future<void> executeStep(String widgetName) async {
    final widget = find.byValueKey(widgetName);
    await FlutterDriverUtils.waitForFlutter(world.driver);
    await FlutterDriverUtils.isPresent(widget, world.driver);
  }

  RegExp get pattern => RegExp(r"I should have {string} page on screen");
}