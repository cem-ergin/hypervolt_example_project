import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';

SizeHelper _sizeHelper = SizeHelper();

class BalanceContainerWidget extends StatelessWidget {
  final Widget child;
  const BalanceContainerWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(85, 112, 242, 1),
        borderRadius: BorderRadius.circular(
          _sizeHelper.getDouble(20),
        ),
      ),
      child: child,
    );
  }
}
