import 'package:flutter/material.dart';
import 'package:pemetaan_array/modals/hexadecimal_handler.dart';
import 'package:pemetaan_array/widget/custom_text_field.dart';

class Array2D extends StatefulWidget {
  @override
  _Array2DState createState() => _Array2DState();
}

class _Array2DState extends State<Array2D> {
  var indexPertama = TextEditingController();
  var indexKedua = TextEditingController();
  var indexPertamaYgDicari = TextEditingController();
  var indexKeduaYgDicari = TextEditingController();
  var posisiAwalMemori = TextEditingController();
  var tipeData = TextEditingController();
  var jawabanPerKolom = '';
  var jawabanPerBaris = '';
  var jumlahElementArray = '';

  int get dataTypeMemory {
    if (tipeData.text.toUpperCase() == 'INT') {
      return 2;
    } else if (tipeData.text.toUpperCase() == 'CHAR') {
      return 1;
    } else if (tipeData.text.toUpperCase() == 'FLOAT') {
      return 4;
    } else if (tipeData.text.toUpperCase() == 'DOUBLE') {
      return 8;
    } else {
      return 0;
    }
  }

  String _cariAlamatIndex2DPerKolom() {
    /*
    Secara Kolom Per Kolom (Coloumn Major Oder / CMO)
    @M[i][j] = @M[0][0] + {(j - 1) * K + (i - 1)} * L
    X[3][2] = 0011(H) + {(2 – 1) * 4 + (3 – 1)} * 4
    = 0011(H) + 24 (D) -> 18 (H)
    = 0011(H) + 18 (H)
    = 0029(H)
     */
    var K = int.tryParse(indexKedua.text);
    var jMinusOne = int.tryParse(indexKeduaYgDicari.text) - 1;
    var iMinusOne = (int.tryParse(indexPertamaYgDicari.text) - 1);
    var tambahanHex =
        ((jMinusOne * K + iMinusOne) * dataTypeMemory).toRadixString(16);
    var hasil =
        HexadecimalHandler().hexAddition(posisiAwalMemori.text, tambahanHex);
    print(hasil);
    return hasil;
  }

  String _cariAlamatIndex2DPerBaris() {
    /*
    Secara Baris Per Baris (Row Major Oder / RMO)
    @M[i][j] = @M[0][0] + {(i - 1) * N + (j - 1)} * L
    X[3][2] = 0011(H) + {(3 – 1) * 3 + (2 – 1)} * 4
    = 0011(H) + 28 (D) -> 1C (H)
    = 0011(H) + 1C (H)
    = 002D(H)
     */
    var N = int.tryParse(indexPertama.text);
    var jMinusOne = int.tryParse(indexKeduaYgDicari.text) - 1;
    var iMinusOne = (int.tryParse(indexPertamaYgDicari.text) - 1);
    var tambahanHex = ((iMinusOne * N + jMinusOne) * dataTypeMemory).toRadixString(16);
    var hasil = HexadecimalHandler().hexAddition(posisiAwalMemori.text, tambahanHex);
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
                    indexPertama,
                    'Masukkan index pertama (Baris) dari array 2D',
                    'Index saat deklarasi array'),
                CustomTextField(
                    indexKedua,
                    'Masukkan index kedua (Kolom) dari array 2D',
                    'Index saat deklarasi array'),
                CustomTextField(posisiAwalMemori, 'Posisi Awal Memory',
                    '0001 (Hexadecimal)'),
                CustomTextField(
                    indexPertamaYgDicari, 'posisi index pertama (baris) yang dicari alamatnya', ''),
                CustomTextField(
                    indexKeduaYgDicari, 'posisi index kedua (kolom) yang dicari alamatnya', ''),
                CustomTextField(tipeData, 'Tipe Data', 'int, char, etc'),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              jawabanPerKolom = _cariAlamatIndex2DPerKolom();
                              jawabanPerBaris = _cariAlamatIndex2DPerBaris();
                              jumlahElementArray = (int.tryParse(
                                          indexPertama.text) *
                                      int.tryParse(indexKedua.text.toString()))
                                  .toString();
                            });
                          },
                          child: Text("Hasil Jawaban")),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Total elemen index: " + jumlahElementArray),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Jawaban dengan cara pandang Kolom: " +
                          jawabanPerKolom),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Jawaban dengan cara pandang Baris: " +
                          jawabanPerBaris),
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
