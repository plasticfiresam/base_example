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
          child: Text(
            '${state.counterValue}',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: onIncrease,
              child: Text('Уменьшить'),
            ),
            FlatButton(
              onPressed: onDecrease,
              child: Text('Увеличить'),
            ),
          ],
        ),
      ],
    );
  }
}
