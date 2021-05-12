import 'package:flutter/material.dart';
import 'package:pemetaan_array/widget/custom_text_field.dart';

class TringularArray extends StatefulWidget {
  @override
  _TringularArrayState createState() => _TringularArrayState();
  static const routeName = '/tringular-array';
}

class _TringularArrayState extends State<TringularArray> {
  var _jumlahBarisDanKolom = TextEditingController();
  var _jawaban = 'Hasil Jawaban';

  double get _hasilJawaban {
    // I = N(N+1) / 2
    // I = 3 (3+1) / 2
    // = 12 / 2
    // = 6
    // N = Jumlah Baris
    var N = int.tryParse(_jumlahBarisDanKolom.text);
    var hasil = N * (N + 1) / 2;
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tringular Array"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomTextField(_jumlahBarisDanKolom, "Masukkan Jumlah Index",
                  "Masukkan salah satu total index baris atau kolom"),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _jawaban =
                                  'Jawabannya adalah: ' + _hasilJawaban.toString();
                            });
                          },
                          child: Text("Jawaban")),
                      SizedBox(
                        height: 20,
                      ),
                      Text(_jawaban)
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
