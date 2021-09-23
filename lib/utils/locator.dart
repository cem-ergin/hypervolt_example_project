import 'package:get_it/get_it.dart';
import 'package:hypervolt_cemergin/repositories/crypto_asset_repository/crypto_asset_repository.dart';

GetIt locator = GetIt.I;

class MyLocator {
  static void setupLocator() {
    locator.registerLazySingleton(() => CryptoAssetRepository());
  }
}
