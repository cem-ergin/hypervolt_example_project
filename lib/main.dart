import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypervolt_cemergin/pages/main_page.dart';

import 'utils/bloc_observer.dart';
import 'utils/locator.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  MyLocator.setupLocator();
  runApp(
    const MainPage(),
  );
}
