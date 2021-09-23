import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hypervolt_cemergin/constants/app_constants.dart';
import 'package:hypervolt_cemergin/models/asset_model.dart';

class CryptoAssetService {
  static Future getCryptoAssets() async {
    final _response = await http.get(
      Uri.parse(
        ApiConstants.CRYPTO_ASSET_ASSETS_URL,
      ),
      headers: {
        'X-CoinAPI-Key': '${ApiConstants.COIN_API_KEY}',
      },
    );
    return _response.statusCode == 200
        ? assetModelFromJson(_response.body)
        : "ERROR";
  }
}
