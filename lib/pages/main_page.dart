import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypervolt_cemergin/blocs/crypto_asset_bloc/asset_bloc.dart';
import 'package:hypervolt_cemergin/blocs/live_prices_bloc/live_prices_bloc.dart';

import 'home_page/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LivePricesBloc(),
        ),
        BlocProvider(
          create: (_) => CryptoAssetBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Hypervolt Cem Ergin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Poppins",
        ),
        home: const HomePage(),
      ),
    );
  }
}
