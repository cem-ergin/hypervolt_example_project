import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';

SizeHelper _sizeHelper = SizeHelper();

class BalanceContainerPercentageWidget extends StatelessWidget {
  final Widget child;

  const BalanceContainerPercentageWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(119, 140, 244, 1),
        borderRadius: BorderRadius.circular(
          _sizeHelper.getDouble(99),
        ),
      ),
      child: child,
    );
  }
}
