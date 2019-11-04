import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  
  
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();





 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Chat'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            color: Colors.white,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextField(
                          controller: nameController,
                          decoration:
                              InputDecoration(labelText: 'Name the group'),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Builder(
                        builder: (context) {
                          return RaisedButton(
                            onPressed: () =>print('p\ ressed'),
                            color: Colors.indigoAccent,
                            child: Text('Submit'),
                          );
                        }
                      )
                    )
                  ],
                ))));
  }
}
