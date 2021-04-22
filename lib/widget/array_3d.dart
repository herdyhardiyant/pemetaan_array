import 'package:flutter/material.dart';
import 'package:pemetaan_array/modals/formula_handler.dart';
import 'package:pemetaan_array/widget/custom_text_field.dart';

class Array3D extends StatefulWidget {
  @override
  _Array3DState createState() => _Array3DState();
}

class _Array3DState extends State<Array3D> {
  var _totalIndex1 = TextEditingController();
  var _totalIndex2 = TextEditingController();
  var _totalIndex3 = TextEditingController();
  var _posisiIndex1 = TextEditingController();
  var _posisiIndex2 = TextEditingController();
  var _posisiIndex3 = TextEditingController();
  var _posisiAwalMemori = TextEditingController();
  var _tipeData = TextEditingController();
  var _jawaban = '';
  var _jumlahElementArray = '';

  String _alamatPosisiArray() {
    /*
    1.Tentukan jumlah elemen array
    A [2][4][3] = (2) * (4) * (3) = 24

    2.@M[m][n][p] = M[0][0][0] + {((m-1) *(jum.elemen2 *jum.elemen3)) + ((n-1)*(jum.elemen3)) + (p-1)}* L

    A[2][3][2] = 0011(H) + {((2–1) * 4 * 3) + ((3-1) * 3) + (2-1)} * 2
    = 0011(H) + {12 + 6 + 1 } * 2
    = 0011(H) + 38 (D) 26 (H)
    = 0011(H) + 26 (H)
    = 0037(H)

     leftHand = ((m-1) *(jum.elemen2 *jum.elemen3))
     rightHand = (n-1)*(jum.elemen3)
     pMinusOne = (p-1)
     L = dataTypeSize
     */
    var leftHand = (int.tryParse(_posisiIndex1.text) - 1) *
        (int.tryParse(_totalIndex2.text) * int.tryParse(_totalIndex3.text));
    var rightHand = (int.tryParse(_posisiIndex2.text) - 1) *
        (int.tryParse(_totalIndex3.text));
    var pMinusOne = int.tryParse(_posisiIndex3.text) - 1;
    var tambahanHex = ((leftHand + rightHand + pMinusOne) *
        FormulaHandler().getDataTypeSize(_tipeData.text)).toRadixString(16);
    var hasil =
        FormulaHandler().hexAddition(_posisiAwalMemori.text, tambahanHex);
    print(hasil);
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemetaan Array 3 Dimensi"),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CustomTextField(
                    _posisiAwalMemori, 'Posisi Awal Memory', 'contoh: 0001'),
                CustomTextField(_totalIndex1, 'Masukkan banyaknya index 1!',
                    'Total index ketika deklarasi array'),
                CustomTextField(_totalIndex2, 'Masukkan banyaknya index 2!',
                    'Total index ketika deklarasi array'),
                CustomTextField(_totalIndex3, 'Masukkan banyaknya index 3!',
                    'Total index ketika deklarasi array'),
                CustomTextField(_posisiIndex1, 'Posisi index 1',
                    'Posisi index array yang dicari alamatnya'),
                CustomTextField(_posisiIndex2, 'Posisi index 2',
                    'Posisi index array yang dicari alamatnya'),
                CustomTextField(_posisiIndex3, 'Posisi index 3',
                    'Posisi index array yang dicari alamatnya'),
                CustomTextField(
                    _tipeData, 'Tipe Data', 'contoh: int, char, etc'),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _jumlahElementArray =
                                  (int.tryParse(_totalIndex1.text) *
                                          int.tryParse(_totalIndex2.text) *
                                          int.tryParse(_totalIndex3.text))
                                      .toString();
                            });
                            _jawaban = _alamatPosisiArray();
                          },
                          child: Text("Hasil Jawaban")),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Total element array: " + _jumlahElementArray),
                      SizedBox(
                        height: 20,
                      ),
                      Text("alamat: " + _jawaban),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
