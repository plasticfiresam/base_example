import 'package:base_arch/base_arch.dart';
import 'package:flutter/foundation.dart';

part './CounterAction.dart';
part './CounterState.dart';

class CounterBloc extends Bloc<CounterState, CounterAction, CounterReducer> {
  CounterBloc(Map<Type, CounterReducer> reducers)
      : super(reducers, CounterState());
}

abstract class CounterReducer<A extends CounterAction>
    extends Reducer<CounterState, A> {}

/// Редьюсер, который возвращает первоначальное состояние
class InitialCounterActionReducer extends CounterReducer<InitialCounterAction> {
  @override
  Stream<CounterState> call(
      CounterState prevState, InitialCounterAction action) async* {
    CounterState nextState = prevState;
    if (action.initialValue != null) {
      nextState = nextState.copyWith(counterValue: action.initialValue);
    }
    yield nextState;
  }
}

/// Редьюсер, отвечающий за обработку IncreaseCounterAction
class IncreaseCounterActionReducer
    extends CounterReducer<IncreaseCounterAction> {
  @override
  Stream<CounterState> call(
      CounterState prevState, IncreaseCounterAction action) async* {
    CounterState nextState = prevState;

    nextState = nextState.copyWith(counterValue: nextState.counterValue + 1);

    yield nextState;
  }
}

/// Редьюсер, отвечающий за обработку DecreaseCounterAction
class DecreaseCounterActionReducer
    extends CounterReducer<DecreaseCounterAction> {
  @override
  Stream<CounterState> call(
      CounterState prevState, DecreaseCounterAction action) async* {
    CounterState nextState = prevState;

    nextState = nextState.copyWith(counterValue: nextState.counterValue - 1);

    yield nextState;
  }
}
