import 'package:flutter/material.dart';

import 'package:pemetaan_array/widget/array_1d.dart';
import 'package:pemetaan_array/widget/array_2d.dart';
import 'package:pemetaan_array/widget/array_3d.dart';
import 'package:pemetaan_array/widget/menu_button.dart';
import 'package:pemetaan_array/widget/tringular_array.dart';

class ArrayFormulaMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
                MenuButton(context, 'Hitung array 1 Dimensi', (context){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Array1D()));
                }),
              MenuButton(context, 'Hitung array 2 Dimensi', (context){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Array2D()));
                }),
              MenuButton(context, 'Hitung array 3 Dimensi', (context){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Array3D()));
                }),
              MenuButton(context, 'Tringular Array', (context){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => TringularArray()));
                }),
            ],
          ),
        ),
      ),
    );
  }
}
