part of 'live_prices_bloc.dart';

@immutable
abstract class LivePricesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateLivePricesEvent extends LivePricesEvent {
  final LivePriceModel livePrices;
  UpdateLivePricesEvent({required this.livePrices});
}

class ClearLivePricesEvent extends LivePricesEvent {
  final String ifError;
  ClearLivePricesEvent({this.ifError = ""});
}
