import 'package:flutter/material.dart';
import 'package:pemetaan_array/modals/hexadecimal_handler.dart';
import 'package:pemetaan_array/widget/custom_text_field.dart';

class Array1D extends StatefulWidget {
  @override
  _Array1DState createState() => _Array1DState();
}

class _Array1DState extends State<Array1D> {
  var inputArray = TextEditingController();
  var posisiAwalMemori = TextEditingController();
  var tipeData = TextEditingController();
  var indexYangDicari = TextEditingController();
  var jawaban = '';

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

  String cariAlamatIndex() {
    var tambahanHex =
        ((int.tryParse(indexYangDicari.text) - 1) * dataTypeMemory)
            .toRadixString(16);
    var hasil =
        HexadecimalHandler().hexAddition(posisiAwalMemori.text, tambahanHex);
    print(hasil);
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemetaan Array 1 Dimensi"),
      ),
      body: Container(
          child: Column(
        children: [
          Column(
            children: [
              CustomTextField(inputArray, 'Masukkan Array', 'A[1]'),
              CustomTextField(posisiAwalMemori, 'Posisi Awal Index Memory',
                  '0001 (Hexadecimal)'),
              CustomTextField(indexYangDicari, 'index yang dicari', ''),
              CustomTextField(tipeData, 'Tipe Data', 'int, char, etc'),
              TextButton(
                  onPressed: () {
                    setState(() {
                      jawaban = cariAlamatIndex();
                    });
                  },
                  child: Text("Hasil Jawaban")),
              SizedBox(
                height: 20,
              ),
              Text(jawaban),
              SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      )),
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
