import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/services/backend.dart';
import 'package:bird_chat/widgets/TextFormControlled.dart';
import 'package:flutter/material.dart';
import 'package:bird_chat/temp.dart';

class CreatePage extends StatefulWidget {
  static const String route = '/create';

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();

  var _event = Event(id: 0, creator: userKey);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Create Meeting'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.1,
                    top: height * 0.025),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      new TextFormControlled(
                          /*
                        inputFormater: ValidatorInputFormatter(
                            editingValidator: SimpleTextRegex()),*/
                          labelText: 'Enter Group Name',
                          hintText: 'Ex: AI and beers',
                          icon: Icons.group,
                          onSaved: (value) {
                            _event.title = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Can not be left blank';
                            }
                            return null;
                          }),
                      new TextFormControlled(
                          // nameController: locationController,
                          labelText: 'Enter Location',
                          icon: Icons.location_on,
                          onSaved: (value) {
                            _event.location = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Can not be left blank';
                            }
                            return null;
                          }),
                      new TextFormControlled(
                          // nameController: nameController,
                          labelText: 'Enter Starting Hour',
                          icon: Icons.access_alarm,
                          textInputType: TextInputType.datetime,
                          onSaved: (value) {
                            print("Deal with time onSave\n");
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Can not be left blank';
                            }
                            return null;
                          }),
                      new TextFormControlled(
                          // nameController: nameController,
                          labelText: 'Enter Description',
                          icon: Icons.description,
                          onSaved: (value) {
                            _event.description = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Can not be left blank';
                            }
                            return null;
                          }),
                      new TextFormControlled(
                          //nameController: nameController,
                          labelText: 'Figuring out How will tags be in here',
                          icon: Icons.error,
                          onSaved: (value) {
                            print("firgure tags: " + value + "nl");
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Can not be left blank';
                            }
                            return null;
                          }),
                    ],
                  ),
                ))),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form.validate()) {
            form.save();
            var controller = new HTMLHandler();
            controller.send(_event);
            Navigator.pop(context);
            
          }
        },
        tooltip: 'Creat Group',
        child: new Icon(Icons.check),
      ),
    );
  }
}
