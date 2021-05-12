import 'package:flutter/material.dart';
import 'package:pemetaan_array/modals/formula_handler.dart';
import 'package:pemetaan_array/widget/custom_text_field.dart';

class Array2D extends StatefulWidget {
  @override
  _Array2DState createState() => _Array2DState();

  static const routeName = '/array-2d';
}

class _Array2DState extends State<Array2D> {
  var _totalBaris = TextEditingController();
  var _totalKolom = TextEditingController();
  var _indexBarisYgDicari = TextEditingController();
  var _indexKolomYgDicari = TextEditingController();
  var _posisiAwalMemori = TextEditingController();
  var _tipeData = TextEditingController();
  var _jawabanPerKolom = '';
  var _jawabanPerBaris = '';
  var _jumlahElementArray = '';

  String _cariAlamatIndex2DPerKolom() {
    var K = int.tryParse(_totalKolom.text);
    var jMinusOne = int.tryParse(_indexKolomYgDicari.text) - 1;
    var iMinusOne = (int.tryParse(_indexBarisYgDicari.text) - 1);
    var formula = ((jMinusOne * K + iMinusOne) *
            FormulaHandler().getDataTypeSize(_tipeData.text))
        .toRadixString(16);
    var result =
        FormulaHandler().hexAddition(_posisiAwalMemori.text, formula);
    print(result);
    return result;
  }

  String _cariAlamatIndex2DPerBaris() {
    var N = int.tryParse(_totalBaris.text);
    var jMinusOne = int.tryParse(_indexKolomYgDicari.text) - 1;
    var iMinusOne = (int.tryParse(_indexBarisYgDicari.text) - 1);
    var tambahanHex = ((iMinusOne * N + jMinusOne) *
            FormulaHandler().getDataTypeSize(_tipeData.text))
        .toRadixString(16);
    var hasil =
        FormulaHandler().hexAddition(_posisiAwalMemori.text, tambahanHex);
    print(hasil);
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemetaan Array 2 Dimensi"),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CustomTextField(
                    _posisiAwalMemori, 'Posisi Awal Memory', 'contoh: 0001'),
                CustomTextField(_totalBaris, 'Masukkan total index 1!',
                    'Total index ketika deklarasi array'),
                CustomTextField(_totalKolom, 'Masukkan total index 2!',
                    'Total index ketika deklarasi array'),
                CustomTextField(_indexBarisYgDicari, 'Posisi index 1',
                    'Posisi index array yang dicari alamatnya'),
                CustomTextField(_indexKolomYgDicari, 'Posisi index 2',
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
                              _jawabanPerKolom = _cariAlamatIndex2DPerKolom();
                              _jawabanPerBaris = _cariAlamatIndex2DPerBaris();
                              _jumlahElementArray = (int.tryParse(
                                          _totalBaris.text) *
                                      int.tryParse(_totalKolom.text.toString()))
                                  .toString();
                            });
                          },
                          child: Text("Hasil Jawaban")),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Total elemen index: " + _jumlahElementArray),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Jawaban dengan cara pandang Kolom: " +
                          _jawabanPerKolom),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Jawaban dengan cara pandang Baris: " +
                          _jawabanPerBaris),
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

/*

@M[i][j] = Posisi Array yg dicari,
M[0][0] = Posisi alamat awal index
array,i = Baris, j = kolom,
L = Ukuran memory type data
K = Banyaknya elemen per kolom,
N = Banyaknya elemen per baris

Secara Baris Per Baris (Row Major Oder / RMO)
@M[i][j] = @M[0][0] + {(i - 1) * N + (j - 1)} * L
X[3][2] = 0011(H) + {(3 – 1) * 3 + (2 – 1)} * 4
= 0011(H) + 28 (D) -> 1C (H)
= 0011(H) + 1C (H)
= 002D(H)

Secara Kolom Per Kolom (Coloumn Major Oder / CMO)
@M[i][j] = @M[0][0] + {(j - 1) * K + (i - 1)} * L
X[3][2] = 0011(H) + {(2 – 1) * 4 + (3 – 1)} * 4
= 0011(H) + 24 (D) -> 18 (H)
= 0011(H) + 18 (H)
= 0029(H)



 */
