import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/constants/app_constants.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';
import 'package:hypervolt_cemergin/helpers/text_style_helper.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomeAppBarView extends StatefulWidget {
  HomeAppBarView({Key? key}) : super(key: key);

  @override
  _HomeAppBarViewState createState() => _HomeAppBarViewState();
}

class _HomeAppBarViewState extends State<HomeAppBarView> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyleHelper.subtitle1,
                ),
                Text(
                  "Cem Ergin",
                  style: TextStyleHelper.heading1,
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundImage: const AssetImage(
              AssetContants.AVATAR_ASSET,
            ),
            radius: _sizeHelper.getWidth(50),
          ),
        ],
      ),
    );
  }
}
