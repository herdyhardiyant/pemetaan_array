import 'package:pemetaan_array/modals/numeric_system.dart';

class DecimalHandler extends NumericSystem{
  String decimal_to_hex(int decimal){
    int rem;
    String hex;

    while(decimal > 0){
      rem = decimal%16;
      hex = NumericSystem.HEX_CHARS[rem] + hex;
      decimal = decimal~/16;
    }
    return hex;
  }
}

