import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hypervolt_cemergin/models/asset_model.dart';
import 'package:http/http.dart' as http;
import 'package:hypervolt_cemergin/repositories/crypto_asset_repository/crypto_asset_repository.dart';
import 'package:hypervolt_cemergin/utils/locator.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class CryptoAssetBloc extends Bloc<CryptoAssetEvent, CryptoAssetState> {
  CryptoAssetBloc() : super(CryptoAssetInitialState()) {
    CryptoAssetRepository _cryptoAssetRepository =
        locator<CryptoAssetRepository>();
    on<CryptoAssetEvent>((event, emit) async {
      if (event is GetCryptoAssetEvent) {
        try {
          final _response = await _cryptoAssetRepository.getCryptoAssets();
          if (_response is List<AssetModel>) {
            emit(
              CryptoAssetSuccessState(assets: _response),
            );
          } else {
            emit(CryptoAssetFailureState(error: "$_response"));
          }
        } on Exception catch (e) {
          emit(CryptoAssetFailureState(error: "$e"));
        }
      }

      //Clearing bloc
      if (event is ClearCryptoAssetEvent) {
        emit(CryptoAssetInitialState());
      }
    });
  }
}
