import 'package:flutter/material.dart';
import 'package:pemetaan_array/screens/array_1d.dart';
import 'package:pemetaan_array/screens/array_2d.dart';
import 'package:pemetaan_array/screens/array_3d.dart';
import 'package:pemetaan_array/screens/tringular_array.dart';

import './screens/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator For Data Structure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MenuScreen(),
        Array1D.routeName: (ctx) => Array1D(),
        Array2D.routeName: (ctx) => Array2D(),
        Array3D.routeName: (ctx) => Array3D(),
        TringularArray.routeName: (ctx) => TringularArray()
      },
    );
  }
}
