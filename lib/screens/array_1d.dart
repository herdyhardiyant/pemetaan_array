import 'package:flutter/material.dart';
import 'package:pemetaan_array/modals/formula_handler.dart';
import 'package:pemetaan_array/widget/custom_text_field.dart';

class Array1D extends StatefulWidget {
  @override
  _Array1DState createState() => _Array1DState();
  static const routeName = '/array-1d';
}

class _Array1DState extends State<Array1D> {
  var _posisiAwalMemori = TextEditingController();
  var _tipeData = TextEditingController();
  var _indexYangDicari = TextEditingController();
  var _jawaban = '';

  String _cariAlamatIndex1D() {
    var formula = ((int.tryParse(_indexYangDicari.text) - 1) *
            FormulaHandler().getDataTypeSize(_tipeData.text))
        .toRadixString(16);
    var result =
        FormulaHandler().hexAddition(_posisiAwalMemori.text, formula);
    print(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemetaan Array 1 Dimensi"),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Column(
              children: [
                CustomTextField(
                    _posisiAwalMemori, 'Posisi Awal Memory', 'contoh: 0001'),
                CustomTextField(_indexYangDicari, 'Posisi index',
                    'Posisi index array yang dicari alamatnya'),
                CustomTextField(_tipeData, 'Tipe Data', 'int, char, etc'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _jawaban = _cariAlamatIndex1D();
                      });
                    },
                    child: Text("Hasil Jawaban")),
                SizedBox(
                  height: 20,
                ),
                Text(_jawaban),
              ],
            )
          ],
        )),
      ),
    );
  }
}

/*
 Formula: @A[i] = B + (i - 1) * L

 Example:
 int A[5] => Cari alamat dari posisi index di A[3]

 A[i] = Posisi Array => A[3]
 B = Posisi Awal Index Memory => 0001 (Hexadecimal)
 i = index yang dicari => A[3] (index = 3)
 L = Ukuran besar memori berdasarkan data type => char = 1 byte

 */
