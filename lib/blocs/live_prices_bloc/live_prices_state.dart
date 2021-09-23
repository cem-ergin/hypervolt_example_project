part of 'live_prices_bloc.dart';

@immutable
abstract class LivePricesState {}

class LivePricesInitialState extends LivePricesState {}

class LivePricesUpdatedState extends LivePricesState {
  final LivePriceModel livePrices;
  final List<LivePriceModel> livePricesList;
  LivePricesUpdatedState(
      {required this.livePrices, required this.livePricesList});
}

class LivePricesFailureState extends LivePricesState {
  final String error;
  LivePricesFailureState({required this.error});
}
