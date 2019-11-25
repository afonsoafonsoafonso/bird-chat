import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/util/stringValidator.dart';
import 'package:bird_chat/widgets/TextFormControlled.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static const String route = '/create';

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();

  var _event = Event();

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
                        inputFormater: ValidatorInputFormatter(
                            editingValidator: SimpleTextRegex()),
                        labelText: 'Enter Group Name',
                        hintText: 'Ex: AI and beers',
                        icon: Icons.group, //WIP
                      ),
                      new TextFormControlled(
                        // nameController: locationController,
                        labelText: 'Enter Location',
                        icon: Icons.location_on,
                      ),
                      new TextFormControlled(
                        // nameController: nameController,
                        labelText: 'Enter Starting Hour',
                        icon: Icons.access_alarm,
                        textInputType: TextInputType.datetime,
                        onSaved: (Value){
                          print("Deal with time onSave\n");
                        },
                      ),
                      new TextFormControlled(
                        // nameController: nameController,
                        labelText: 'Enter Description',
                        icon: Icons.description,
                        onSaved: (Value){
                          _event.description=Value;
                        },
                      ),
                      new TextFormControlled(
                        //nameController: nameController,
                        labelText: 'Figuring out How will tags be in here',
                        icon: Icons.error,
                        onSaved: (Value){
                          print("firgure tags: " + Value+"nl");
                        }
                      ),
                    ],
                  ),
                ))),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form.validate()) {
            form.save();
            Navigator.pop(context);
          }
        },
        tooltip: 'Creat Group',
        child: new Icon(Icons.check),
      ),
    );
  }
}
