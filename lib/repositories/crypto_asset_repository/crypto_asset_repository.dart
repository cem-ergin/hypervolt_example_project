import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/models/asset_model.dart';
import 'package:hypervolt_cemergin/repositories/crypto_asset_repository/crypto_asset_service.dart';

class CryptoAssetRepository {
  /// I am not using this getter and setters for now
  /// because that's not necessary in this situation
  /// normally I am using these in repository..
  late AssetModel _assetModel;
  AssetModel get assetModel => _assetModel;
  set assetModel(AssetModel assetModel) {
    _assetModel = assetModel;
  }

  //For getting crypto assets
  Future getCryptoAssets() async {
    return await CryptoAssetService.getCryptoAssets();
  }
}
