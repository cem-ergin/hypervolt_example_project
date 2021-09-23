import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hypervolt_cemergin/models/live_price_model.dart';
import 'package:meta/meta.dart';

part 'live_prices_event.dart';
part 'live_prices_state.dart';

class LivePricesBloc extends Bloc<LivePricesEvent, LivePricesState> {
  LivePricesBloc() : super(LivePricesInitialState()) {
    final List<LivePriceModel> _livePrices = [];
    on<LivePricesEvent>(
      (event, emit) {
        if (event is UpdateLivePricesEvent) {
          final _currentState = state;

          if (_currentState is LivePricesInitialState) {
            _livePrices.add(event.livePrices);
            emit(
              LivePricesUpdatedState(
                livePrices: event.livePrices,
                livePricesList: _livePrices,
              ),
            );
          } else if (_currentState is LivePricesUpdatedState) {
            final int _index = _livePrices.indexWhere(
              (element) => element.symbolId == event.livePrices.symbolId,
            );
            if (_index == -1) {
              _livePrices.add(event.livePrices);
            } else {
              event.livePrices.isRaising =
                  _livePrices[_index].price! < event.livePrices.price!;
              _livePrices[_index] = event.livePrices;
            }
            emit(
              LivePricesUpdatedState(
                livePrices: event.livePrices,
                livePricesList: _livePrices,
              ),
            );
          } else {
            emit(
              LivePricesFailureState(
                error: "There is an unknown error occured. Please try again",
              ),
            );
          }
        }
        if (event is ClearLivePricesEvent) {
          event.ifError.isNotEmpty
              ? emit(LivePricesFailureState(error: event.ifError))
              : emit(LivePricesInitialState());
        }
      },
    );
  }
}
