class HexadecimalHandler{

  String hexAddition(hex1, hex2){
    var value1 = int.parse(hex1, radix: 16);
    var value2 = int.parse(hex2, radix: 16);
    var result = (value1 + value2).toRadixString(16);
    return result.padLeft(4, '0').toUpperCase() + '(H)';
  }

}