import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';
import 'package:hypervolt_cemergin/helpers/text_style_helper.dart';
import 'package:hypervolt_cemergin/widgets/balance_container_percentage_widget.dart';
import 'package:hypervolt_cemergin/widgets/balance_container_widget.dart';

SizeHelper _sizeHelper = SizeHelper();

class HomeBalanceView extends StatelessWidget {
  const HomeBalanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BalanceContainerWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _sizeHelper.getWidth(40),
          vertical: _sizeHelper.getHeight(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyleHelper.subtitle1InvertedColor,
                ),
                Text(
                  "\$450,933",
                  style: TextStyleHelper.big1,
                ),
              ],
            ),
            _sizeHelper.sbh(60),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly Profit",
                        style: TextStyleHelper.subtitle1InvertedColor,
                      ),
                      Text(
                        "\$12,484",
                        style: TextStyleHelper.big2,
                      ),
                    ],
                  ),
                ),
                BalanceContainerPercentageWidget(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_up,
                        color: Color.fromRGBO(142, 236, 179, 1),
                      ),
                      Text(
                        "10 %",
                        style: TextStyleHelper.small1,
                      ),
                      _sizeHelper.sbw(8),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
