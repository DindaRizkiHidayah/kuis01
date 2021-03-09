
import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  const Hasil({
    Key key,
    @required double celcius,
    @required double kelvin,
    @required double reamur,
    @required double fahrenheit,
  }) : _celcius = celcius, _kelvin = kelvin, _reamur = reamur, _fahrenheit = fahrenheit, super(key: key);

  final double _celcius;
  final double _kelvin;
  final double _reamur;
  final double _fahrenheit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Celcius (C) : ',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                'Kelvin (K) : ',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                'Reamur (R) : ',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                'Fahrenheit (F) : ',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                '$_celcius',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '$_kelvin',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '$_reamur',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '$_fahrenheit',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
