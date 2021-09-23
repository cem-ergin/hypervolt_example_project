import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypervolt_cemergin/blocs/crypto_asset_bloc/asset_bloc.dart';
import 'package:hypervolt_cemergin/blocs/live_prices_bloc/live_prices_bloc.dart';
import 'package:hypervolt_cemergin/constants/app_constants.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';
import 'package:hypervolt_cemergin/helpers/string_helper.dart';
import 'package:hypervolt_cemergin/helpers/text_style_helper.dart';
import 'package:hypervolt_cemergin/models/asset_model.dart';
import 'package:hypervolt_cemergin/models/live_price_model.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomeLivePricesView extends StatefulWidget {
  HomeLivePricesView({Key? key}) : super(key: key);

  @override
  _HomeLivePricesViewState createState() => _HomeLivePricesViewState();
}

class _HomeLivePricesViewState extends State<HomeLivePricesView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivePricesBloc, LivePricesState>(
      builder: (context, state) {
        if (state is LivePricesInitialState) {
          _connectWs();
        }
        if (state is LivePricesUpdatedState) {
          return _buildUpdatedStateView(state);
        }
        if (state is LivePricesFailureState) {
          return _buildFailureStateView(state, context);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  TextButton _buildFailureStateView(
      LivePricesFailureState state, BuildContext context) {
    return TextButton(
      child: Text("${state.error}"),
      onPressed: () {
        BlocProvider.of<LivePricesBloc>(context).add(
          ClearLivePricesEvent(),
        );
      },
    );
  }

  Container _buildUpdatedStateView(LivePricesUpdatedState state) {
    return Container(
      height: _sizeHelper.getHeight(450),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: state.livePricesList.length,
        itemBuilder: (BuildContext context, int index) {
          return state.livePricesList[index].price != null
              ? Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      _sizeHelper.getDouble(16),
                    ),
                  ),
                  elevation: 0.3,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        _sizeHelper.getDouble(16),
                      ),
                      color: state.livePricesList[index].isRaising != null
                          ? state.livePricesList[index].isRaising!
                              ? Colors.green.withOpacity(0.2)
                              : Colors.red.withOpacity(0.2)
                          : Colors.transparent,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: _sizeHelper.getWidth(40),
                        vertical: _sizeHelper.getHeight(20),
                      ),
                      height: _sizeHelper.getHeight(450),
                      width: _sizeHelper.getHeight(520),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              BlocBuilder<CryptoAssetBloc, CryptoAssetState>(
                                builder: (context, stateAsset) {
                                  if (stateAsset is CryptoAssetSuccessState) {
                                    final _myCoinSymbol =
                                        StringHelper.getCoinSymbol(state
                                            .livePricesList[index].symbolId!);
                                    final _cryptoAsset =
                                        stateAsset.assets.firstWhere(
                                      (element) =>
                                          element.assetId == _myCoinSymbol,
                                      orElse: () =>
                                          AssetModel(url: "", assetId: ""),
                                    );
                                    return _cryptoAsset.url!.isNotEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl: _cryptoAsset.url!,
                                              placeholder: (_, __) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget: (_, __, ___) =>
                                                  const Center(
                                                child: Icon(Icons.error),
                                              ),
                                              width: _sizeHelper.getWidth(100),
                                            ),
                                          )
                                        : Container();
                                  }
                                  return Container();
                                },
                              ),
                              Text(
                                StringHelper.seperateCoinSymbol(
                                        state.livePricesList[index].symbolId!)
                                    .first,
                                style: TextStyleHelper.body1Bold,
                              ),
                              Text(
                                StringHelper.seperateCoinSymbol(
                                        state.livePricesList[index].symbolId!)
                                    .last,
                                style: TextStyleHelper.body1,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${state.livePricesList[index].price!.toStringAsFixed(4)}",
                                style: TextStyleHelper.big2InvertedColor,
                              ),
                            ),
                          ),
                          Text(
                            "${state.livePricesList[index].takerSide}",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container();
        },
      ),
    );
  }

  Future<WebSocket> _connectWs() async {
    final baseURI = Uri.parse(ApiConstants.COIN_BASE_URL);
    final _uri = Uri(
      scheme: "ws",
      host: baseURI.host,
      port: baseURI.port,
      path: baseURI.path,
    );

    final socket = await WebSocket.connect(_uri.toString());

    socket.add(
      json.encode({
        "type": "hello",
        "apikey": ApiConstants.COIN_API_KEY,
        "heartbeat": false,
        "subscribe_data_type": ["trade"],
        "subscribe_filter_symbol_id": [
          r"COINBASE_SPOT_BTC_USD$",
          r"COINBASE_SPOT_ETH_USD$",
          r"COINBASE_SPOT_ADA_USD$",
          r"COINBASE_SPOT_BNB_USD$",
          r"COINBASE_SPOT_XRP_USD$",
          r"COINBASE_SPOT_NXT_USD$",
          r"COINBASE_SPOT_DOT_USD$",
          r"COINBASE_SPOT_PLN_USD$",
          r"COINBASE_SPOT_EUR_USD$",
          r"COINBASE_SPOT_DOGE_USD$",
        ]
      }),
    );

    socket.listen(
      (data) {
        final _livePrices = livePriceModelFromJson(data);
        if (_livePrices is LivePriceModel) {
          BlocProvider.of<LivePricesBloc>(context).add(
            UpdateLivePricesEvent(livePrices: _livePrices),
          );
        }
      },
    );

    return socket;
  }
}
