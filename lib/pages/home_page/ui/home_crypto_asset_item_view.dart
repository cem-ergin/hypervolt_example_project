import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';
import 'package:hypervolt_cemergin/helpers/text_style_helper.dart';
import 'package:hypervolt_cemergin/models/asset_model.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomeCryptoAssetItemView extends StatefulWidget {
  final AssetModel cryptoAssetModel;
  HomeCryptoAssetItemView({
    Key? key,
    required this.cryptoAssetModel,
  }) : super(key: key);

  @override
  _HomeCryptoAssetItemViewState createState() =>
      _HomeCryptoAssetItemViewState();
}

class _HomeCryptoAssetItemViewState extends State<HomeCryptoAssetItemView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          _sizeHelper.getDouble(2),
        ),
      ),
      elevation: 0.3,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _sizeHelper.getWidth(40),
          vertical: _sizeHelper.getHeight(20),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.cryptoAssetModel.url!,
              placeholder: (_, __) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (_, __, ___) => const Center(
                child: Icon(Icons.error),
              ),
              width: _sizeHelper.getWidth(60),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${widget.cryptoAssetModel.assetId}",
                  style: TextStyleHelper.body1Bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
