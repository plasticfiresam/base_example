part of './CounterBloc.dart';

class CounterState extends State {
  int counterValue;

  CounterState({
    this.counterValue = 0,
  });

  @override
  CounterState copyWith({
    int counterValue,
  }) {
    CounterState nextState = CounterState();

    nextState.counterValue = counterValue ?? this.counterValue;

    return nextState;
  }
}
