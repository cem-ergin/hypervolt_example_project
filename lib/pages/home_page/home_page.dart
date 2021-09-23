import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypervolt_cemergin/blocs/crypto_asset_bloc/asset_bloc.dart';
import 'package:hypervolt_cemergin/blocs/live_prices_bloc/live_prices_bloc.dart';
import 'package:hypervolt_cemergin/constants/app_constants.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';
import 'package:hypervolt_cemergin/helpers/string_helper.dart';
import 'package:hypervolt_cemergin/helpers/text_style_helper.dart';
import 'package:hypervolt_cemergin/models/asset_model.dart';
import 'package:hypervolt_cemergin/models/live_price_model.dart';
import 'package:hypervolt_cemergin/pages/home_page/ui/home_appbar_view.dart';
import 'package:hypervolt_cemergin/pages/home_page/ui/home_crypto_asset_item_view.dart';
import 'package:hypervolt_cemergin/widgets/balance_container_percentage_widget.dart';
import 'package:hypervolt_cemergin/widgets/balance_container_widget.dart';

import 'ui/home_balance_view.dart';
import 'ui/home_crypto_asset_view.dart';
import 'ui/home_live_prices_view.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _sizeHelper.context = context;
    _sizeHelper.padding = MediaQuery.of(context).padding;
    _sizeHelper.size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: _sizeHelper.getWidth(40),
        ),
        children: [
          _sizeHelper.sbh(120),
          HomeAppBarView(),
          _sizeHelper.sbh(90),
          HomeBalanceView(),
          _sizeHelper.sbh(36),
          Text(
            "Live prices",
            style: TextStyleHelper.subtitle1,
          ),
          _sizeHelper.sbh(24),
          HomeLivePricesView(),
          _sizeHelper.sbh(36),
          Text(
            "Crypto assets",
            style: TextStyleHelper.subtitle1,
          ),
          _sizeHelper.sbh(24),
          HomeCryptoAssetView(),
        ],
      ),
    );
  }
}
