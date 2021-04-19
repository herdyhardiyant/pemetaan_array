import 'package:flutter/material.dart';

class Array1D extends StatefulWidget {
  @override
  _Array1DState createState() => _Array1DState();
}

class _Array1DState extends State<Array1D> {


  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      Text("Pemetaan Array 1 Dimensi"),
      TextField(),
      ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Return"))
    ],));
  }
}
