import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalcApp());

class CalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PDP7 Calc',
        home: Scaffold(
          body: Calc(),
        ));
  }
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  TextField textField;
  List<String> values = [];

  _buildRow(int index) {
    if (index == values.length) {
      return TextField(
        keyboardType: TextInputType.number,
        onSubmitted: _submitted,
        autofocus: true,
        textAlign: TextAlign.right,
      );
    }
    return Text(values[index]);
  }

  _submitted(String text) {
    setState(() {
      values.add(
          ExpressionEvaluator().eval(Expression.parse(text), {}).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.values.length + 1,
      itemBuilder: (context, index) => this._buildRow(index),
    );
  }
}
