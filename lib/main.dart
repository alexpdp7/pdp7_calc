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
  int elements = 1;
  TextField textField;

  _buildRow(int index) {
    if (index == elements - 1) {
      return TextField(
        keyboardType: TextInputType.number,
        onSubmitted: _submitted,
        autofocus: true,
      );
    }
    return Text("Item " + index.toString());
  }

  _submitted(String text) {
    setState(() {
      elements = elements + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.elements,
      itemBuilder: (context, index) => this._buildRow(index),
    );
  }
}
