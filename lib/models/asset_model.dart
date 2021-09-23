// To parse this JSON data, do
//
//     final assetModel = assetModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<AssetModel> assetModelFromJson(String str) =>
    List<AssetModel>.from(json.decode(str).map((x) => AssetModel.fromJson(x)));

String assetModelToJson(List<AssetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetModel {
  AssetModel({
    @required this.assetId,
    @required this.url,
  });

  final String? assetId;
  final String? url;

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        assetId: json["asset_id"] == null ? null : json["asset_id"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": assetId == null ? null : assetId,
        "url": url == null ? null : url,
      };
}
