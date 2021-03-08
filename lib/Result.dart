import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hasil",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          result.toStringAsFixed(1),
          style: TextStyle(fontSize: 30),
        )
      ],
    );
  }
}
