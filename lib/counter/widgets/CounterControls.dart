import 'package:flutter/material.dart';

class CounterControls extends StatelessWidget {
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CounterControls({
    Key key,
    @required this.onIncrease,
    @required this.onDecrease,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: onDecrease,
              child: Text(
                'Уменьшить',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: onIncrease,
              child: Text(
                'Увеличить',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
