import 'package:base_arch/base_arch.dart';
import 'package:base_example/counter/CounterBloc.dart';
import 'package:base_example/counter/CounterPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  Navigation navigation = NavigationImplementation(navKey);

  runApp(
    MultiProvider(
      providers: [
        Provider<CounterBloc>(
          create: (BuildContext context) => CounterBloc({
            IncreaseCounterAction: IncreaseCounterActionReducer(),
            DecreaseCounterAction: DecreaseCounterActionReducer()
          }),
        ),
      ],
      child: BaseCounterExample(),
    ),
  );
}

class BaseCounterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Счётчик',
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => CounterPage(),
      },
    );
  }
}
