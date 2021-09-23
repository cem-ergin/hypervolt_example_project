import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

LivePriceModel livePriceModelFromJson(String str) =>
    LivePriceModel.fromJson(json.decode(str));

String livePriceModelToJson(LivePriceModel data) => json.encode(data.toJson());

class LivePriceModel extends Equatable {
  LivePriceModel({
    @required this.timeExchange,
    @required this.timeCoinapi,
    @required this.uuid,
    @required this.price,
    @required this.oldPrice,
    @required this.size,
    @required this.takerSide,
    @required this.symbolId,
    @required this.sequence,
    @required this.type,
    @required this.isRaising,
  });

  final DateTime? timeExchange;
  final DateTime? timeCoinapi;
  final String? uuid;
  final double? price;
  double? oldPrice;
  final double? size;
  final String? takerSide;
  final String? symbolId;
  final int? sequence;
  final String? type;
  bool? isRaising;

  factory LivePriceModel.fromJson(Map<String, dynamic> json) => LivePriceModel(
        timeExchange: json["time_exchange"] == null
            ? null
            : DateTime.parse(json["time_exchange"]),
        timeCoinapi: json["time_coinapi"] == null
            ? null
            : DateTime.parse(json["time_coinapi"]),
        uuid: json["uuid"] == null ? null : json["uuid"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        size: json["size"] == null ? null : json["size"].toDouble(),
        takerSide: json["taker_side"] == null ? null : json["taker_side"],
        symbolId: json["symbol_id"] == null ? null : json["symbol_id"],
        sequence: json["sequence"] == null ? null : json["sequence"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "time_exchange":
            timeExchange == null ? null : timeExchange!.toIso8601String(),
        "time_coinapi":
            timeCoinapi == null ? null : timeCoinapi!.toIso8601String(),
        "uuid": uuid == null ? null : uuid,
        "price": price == null ? null : price,
        "size": size == null ? null : size,
        "taker_side": takerSide == null ? null : takerSide,
        "symbol_id": symbolId == null ? null : symbolId,
        "sequence": sequence == null ? null : sequence,
        "type": type == null ? null : type,
      };

  @override
  List<Object?> get props => [
        timeExchange,
        timeCoinapi,
        uuid,
        price,
        size,
        takerSide,
        symbolId,
        sequence,
        type,
      ];
}
