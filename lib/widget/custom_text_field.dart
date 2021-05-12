import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController inputValue;
  final String labelText;
  final String helper;

  CustomTextField(this.inputValue, this.labelText, this.helper);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              helperText: helper,
              helperStyle: TextStyle(color: Colors.grey)),
          controller: inputValue),
      margin: EdgeInsets.all(20),
    );
  }
}

// This custom widget can only be used in array text input widget
