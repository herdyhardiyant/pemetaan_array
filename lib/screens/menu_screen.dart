import 'package:flutter/material.dart';

import 'package:pemetaan_array/screens/array_1d.dart';
import 'package:pemetaan_array/screens/array_2d.dart';
import 'package:pemetaan_array/screens/array_3d.dart';
import 'package:pemetaan_array/widget/menu_button.dart';
import 'package:pemetaan_array/screens/tringular_array.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pemetaan Array"),
        ),
        body: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuButton(
                      context, 'Hitung array 1 Dimensi', Array1D.routeName),
                  MenuButton(
                      context, 'Hitung array 2 Dimensi', Array2D.routeName),
                  MenuButton(
                      context, 'Hitung array 3 Dimensi', Array3D.routeName),
                  MenuButton(
                      context, 'Tringular Array', TringularArray.routeName),
                ],
              ),
            ),
          ),
        ));
  }
}
