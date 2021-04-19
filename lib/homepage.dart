import 'package:flutter/material.dart';
import 'package:pemetaan_array/widget/array_formula_menu.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pemetaan Array"),
        ),
        body: ArrayFormulaMenu());
  }
}
