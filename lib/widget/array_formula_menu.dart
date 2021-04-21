import 'package:flutter/material.dart';

import 'package:pemetaan_array/widget/array_1d.dart';
import 'package:pemetaan_array/widget/array_2d.dart';
import 'package:pemetaan_array/widget/array_3d.dart';

class ArrayFormulaMenu extends StatelessWidget {
  
  static const _spacesBetweenElementsInsideColumn = 40.00;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Array1D()));
                },
                child: Text("Hitung Array 1 Dimensi")),
            SizedBox(
              height: _spacesBetweenElementsInsideColumn,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Array2D()));
                },
                
                child: Text("Hitung Array 2 Dimensi")),
            SizedBox(
              height: _spacesBetweenElementsInsideColumn,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Array3D()));
                },
                child: Text("Hitung Array 3 Dimensi")),
          ],
        ),
      ),
    );
  }
}
