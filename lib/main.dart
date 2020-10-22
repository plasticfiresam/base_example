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
            InitialCounterAction: InitialCounterActionReducer(),
            IncreaseCounterAction: IncreaseCounterActionReducer(),
            DecreaseCounterAction: DecreaseCounterActionReducer()
          }),
        ),
      ],
      child: BaseCounterExample(
        navigatorKey: navKey,
      ),
    ),
  );
}

class BaseCounterExample extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const BaseCounterExample({
    Key key,
    @required this.navigatorKey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Счётчик',
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => CounterPage(),
      },
    );
  }
}
