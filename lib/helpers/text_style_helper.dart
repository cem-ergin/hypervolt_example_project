import 'package:flutter/material.dart';
import 'package:hypervolt_cemergin/helpers/size_helper.dart';

final SizeHelper _sizeHelper = SizeHelper();

class TextStyleHelper {
  static TextStyle get small1 => TextStyle(
        fontSize: _sizeHelper.getWidth(23),
        fontWeight: FontWeight.w300,
        color: Colors.white,
      );
  static TextStyle get subtitle1 => TextStyle(
        fontSize: _sizeHelper.getWidth(30),
        fontWeight: FontWeight.w300,
      );
  static TextStyle get subtitle1InvertedColor => TextStyle(
        fontSize: _sizeHelper.getWidth(30),
        fontWeight: FontWeight.w300,
        color: Colors.white,
      );
  static TextStyle get heading1 => TextStyle(
        fontSize: _sizeHelper.getWidth(36),
        fontWeight: FontWeight.w700,
      );
  static TextStyle get big1 => TextStyle(
        fontSize: _sizeHelper.getWidth(65),
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );
  static TextStyle get big2 => TextStyle(
        fontSize: _sizeHelper.getWidth(45),
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );
  static TextStyle get big2InvertedColor => TextStyle(
        fontSize: _sizeHelper.getWidth(45),
        fontWeight: FontWeight.w700,
      );
  static TextStyle get body1 => TextStyle(
        fontSize: _sizeHelper.getWidth(35),
      );
  static TextStyle get body1Bold => TextStyle(
        fontSize: _sizeHelper.getWidth(35),
        fontWeight: FontWeight.w700,
      );
}
