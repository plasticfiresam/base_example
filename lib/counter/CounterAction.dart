part of 'CounterBloc.dart';

abstract class CounterAction extends Action {}

/// Увеличение на единицу
class IncreaseCounterAction extends CounterAction {}

/// Уменьшение на единицу
class DecreaseCounterAction extends CounterAction {}
