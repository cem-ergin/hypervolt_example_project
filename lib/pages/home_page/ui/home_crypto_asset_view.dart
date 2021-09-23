import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypervolt_cemergin/blocs/crypto_asset_bloc/asset_bloc.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';
import 'package:hypervolt_cemergin/pages/home_page/ui/home_crypto_asset_item_view.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomeCryptoAssetView extends StatefulWidget {
  HomeCryptoAssetView({Key? key}) : super(key: key);

  @override
  _HomeCryptoAssetViewState createState() => _HomeCryptoAssetViewState();
}

class _HomeCryptoAssetViewState extends State<HomeCryptoAssetView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoAssetBloc, CryptoAssetState>(
      builder: (context, state) {
        if (state is CryptoAssetInitialState) {
          BlocProvider.of<CryptoAssetBloc>(context).add(
            GetCryptoAssetEvent(),
          );
        }
        if (state is CryptoAssetSuccessState) {
          return _buildSuccessStateView(state);
        }
        if (state is CryptoAssetFailureState) {
          return _buildFailureStateView(state, context);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  TextButton _buildFailureStateView(
      CryptoAssetFailureState state, BuildContext context) {
    return TextButton(
      child: Text("${state.error}"),
      onPressed: () {
        BlocProvider.of<CryptoAssetBloc>(context).add(
          ClearCryptoAssetEvent(),
        );
      },
    );
  }

  Container _buildSuccessStateView(CryptoAssetSuccessState state) {
    return Container(
      height: _sizeHelper.getHeight(1080),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: state.assets.length,
        itemBuilder: (BuildContext context, int index) {
          final _cryptoAsset = state.assets[index];

          return FadeInRight(
            child: HomeCryptoAssetItemView(
              cryptoAssetModel: _cryptoAsset,
            ),
          );
        },
      ),
    );
  }
}
