part of 'asset_bloc.dart';

abstract class CryptoAssetState extends Equatable {
  const CryptoAssetState();

  @override
  List<Object> get props => [];
}

class CryptoAssetInitialState extends CryptoAssetState {}

class CryptoAssetSuccessState extends CryptoAssetState {
  final List<AssetModel> assets;
  CryptoAssetSuccessState({required this.assets});
}

class CryptoAssetFailureState extends CryptoAssetState {
  final String error;
  CryptoAssetFailureState({required this.error});
}
