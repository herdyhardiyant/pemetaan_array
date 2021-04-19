import 'package:flutter/material.dart';


class Array2D extends StatefulWidget {
  @override
  _Array2DState createState() => _Array2DState();
}

class _Array2DState extends State<Array2D> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      Text("Array 2"),
      ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Return"))
    ],));
  }
}
