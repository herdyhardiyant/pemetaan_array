import 'package:flutter/material.dart';

class Array1D extends StatefulWidget {
  @override
  _Array1DState createState() => _Array1DState();
}

class _Array1DState extends State<Array1D> {
  String input_array, posisi_memori;
  int index_yg_dicari, besar_memori;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("Pemetaan Array 1 Dimensi"),
        TextField(
          decoration: InputDecoration(labelText: 'Input Array, contoh: A[5]'),
          onChanged: (value) => input_array = value,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: 'Posisi awal memori (hex), contoh: 001A'),
          onChanged: (value) => posisi_memori = value,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: 'Posisi index array yang dicari alamatnya'),
          onChanged: (value) => input_array = value,
          keyboardType: TextInputType.number,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Akuruan besar memori array'),
          onChanged: (value) => input_array = value,
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
            onPressed: () => Navigator.pop(context), child: Text("Return"))
      ],
    ));
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
