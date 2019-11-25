import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormControlled extends StatelessWidget {
  TextFormControlled({
    Key key,
    this.inputFormater,
    this.labelText = " ",
    this.hintText = " ",
    this.icon,
    this.textInputType,
    this.onSaved,
    this.validator
  }) : super(key: key);

  final TextInputFormatter inputFormater;
  final String labelText;
  final String hintText;
  final icon;
  final TextInputType textInputType;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          //inputFormatters: [inputFormater],
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            icon: Icon(icon),
          ),
          keyboardType: textInputType,
          validator: validator,
          onSaved: onSaved,
        ));
  }
}
