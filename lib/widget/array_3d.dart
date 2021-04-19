import 'package:flutter/material.dart';

class Array3D extends StatefulWidget {
  @override
  _Array3DState createState() => _Array3DState();
}

class _Array3DState extends State<Array3D> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      Text("Array 3"),
      ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Return"))
    ],));
  }
}
