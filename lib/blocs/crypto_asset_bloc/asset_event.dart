part of 'asset_bloc.dart';

abstract class CryptoAssetEvent extends Equatable {
  const CryptoAssetEvent();

  @override
  List<Object> get props => [];
}

class GetCryptoAssetEvent extends CryptoAssetEvent {}

class ClearCryptoAssetEvent extends CryptoAssetEvent {}
