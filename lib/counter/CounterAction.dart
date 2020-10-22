part of 'CounterBloc.dart';

abstract class CounterAction extends Action {}

/// Запрос начального состояния
class InitialCounterAction extends CounterAction {
  final int initialValue;

  InitialCounterAction({this.initialValue = 0});
}

/// Увеличение на единицу
class IncreaseCounterAction extends CounterAction {}

/// Уменьшение на единицу
class DecreaseCounterAction extends CounterAction {}
