import 'package:base_example/counter/widgets/CounterWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterBloc.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CounterBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Счётчик'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _bloc.state,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return CounterWidget(
                    state: snapshot.data,
                    onIncrease: () => _bloc.add(IncreaseCounterAction()),
                    onDecrease: () => _bloc.add(DecreaseCounterAction()),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
