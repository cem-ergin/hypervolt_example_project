// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hypervolt_cemergin/models/live_price_model.dart';

void main() {
  group('testRedAndGreenAnimation', () {
    LivePriceModel _oldPrice = LivePriceModel(price: 10.4);
    LivePriceModel _newPrice = LivePriceModel(price: 10.3);

    test('Test green animation', () {
      var _boolValue = _oldPrice.price! < _newPrice.price!;
      expect(_boolValue, false);
    });
  });
}
