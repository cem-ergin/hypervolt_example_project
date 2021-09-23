import 'package:flutter/material.dart';

class StringHelper {
  static List<String> seperateCoinSymbol(String symbolId) {
    return [
      symbolId.split("_")[symbolId.split("_").length - 2],
      "/" + symbolId.split("_").last,
    ];
  }

  static String getCoinSymbol(String symbolId) {
    return symbolId.split("_")[symbolId.split("_").length - 2];
  }
}
