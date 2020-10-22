import 'package:base_example/counter/widgets/CounterControls.dart';
import 'package:flutter/material.dart';

import '../CounterBloc.dart';

class CounterWidget extends StatelessWidget {
  final CounterState state;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CounterWidget({
    Key key,
    @required this.state,
    @required this.onIncrease,
    @required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              '${state.counterValue}',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        CounterControls(
          onIncrease: onIncrease,
          onDecrease: onDecrease,
        ),
      ],
    );
  }
}
