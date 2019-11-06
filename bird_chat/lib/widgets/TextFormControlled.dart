import 'package:flutter/material.dart';

class TextFormControlled extends StatelessWidget {
  const TextFormControlled({
    Key key,
    @required this.nameController,
    this.labelText = " ",
    this.hintText = " ",
    this.icon  ,
  }) : super(key: key);

  final TextEditingController nameController;
  final String labelText;
  final String hintText;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            icon: Icon(icon),
          ),
        ));
  }
}
