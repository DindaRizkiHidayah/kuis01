import 'package:flutter/material.dart';

import 'Convert.dart';
import 'Input.dart';
import 'Result.dart';
import 'Riwayat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _celcius = 0;
  double _fahrenheit = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = List<String>();
  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Celcius") {
        _celcius=_inputUser;
        _kelvin = _inputUser + 273.15;
        _reamur =  (4 / 5) *_inputUser ;
        _fahrenheit =  (9 / 5) *_inputUser + 32;
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Reamur") {
        _reamur=_inputUser;
        _celcius = _inputUser * (5/4);
        _fahrenheit = ( 9 / 4) * _inputUser + 32;
        _kelvin = ( 5 / 4) * _inputUser + 273;
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Kelvin") {
        _celcius = _inputUser - 273;
        _reamur = (_inputUser - 273) * 4 / 5;
        _kelvin=_inputUser;
        _fahrenheit = (_inputUser - 273) * 9 / 5 + 32;
        listViewItem.add("$_newValue : $_result");
      } else {
        _celcius = (_inputUser -32) * 5/9;
        _reamur = 4/9 * (_inputUser -32);
        _kelvin = (_inputUser + 469.67) * 5/9;
        _fahrenheit = _inputUser;
        listViewItem.add("$_newValue : $_result");
      }
    });
  }

  void perhitunganReamur() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = (5 / 4) * _inputUser + 273;
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Celcius") {
        _result = (5 / 4) * _inputUser;
        listViewItem.add("$_newValue : $_result");
      } else {
        _result = (9 / 4) * _inputUser + 32;
        listViewItem.add("$_newValue : $_result");
      }
    });
  }

  // void perhitunganKelvin() {
  //   setState(() {
  //     _inputUser = double.parse(inputController.text);
  //     if (_newValue == "Celcius") {
  //       _result = _inputUser - 273;
  //       listViewItem.add("$_newValue : $_result");
  //     } else if (_newValue == "Reamur") {
  //       _result = 4 / 5 * (_inputUser - 273);
  //       listViewItem.add("$_newValue : $_result");
  //     } else {
  //       _result = 9 / 5 * (_inputUser - 273) + 32;
  //       listViewItem.add("$_newValue : $_result");
  //     }
  //   });
  // }

  // void perhitunganFahrenheit() {
  //   setState(() {
  //     _inputUser = double.parse(inputController.text);
  //     if (_newValue == "Celcius") {
  //       _result = 5 / 9 * (_inputUser - 32);
  //       listViewItem.add("$_newValue : $_result");
  //     } else if (_newValue == "Reamur") {
  //       _result = 4 / 9 * (_inputUser - 32);
  //       listViewItem.add("$_newValue : $_result");
  //     } else {
  //       _result = 5 / 9 * (_inputUser - 32) + 273;
  //       listViewItem.add("$_newValue : $_result");
  //     }
  //   });
  // }

  var listItem1 = ["Celcius", "Kelvin", "Reamur", "Fahrenheit"];
  var listItem = ["Celcius", "Kelvin", "Reamur", "Fahrenheit"];
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(inputController: inputController),
              Column(
                children: [
                  DropdownButton<String>(
                    items: listItem1.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _newValue,
                    onChanged: (String changeValue) {
                      setState(() {
                        _newValue = changeValue;
                        // perhitunganCelcius();
                        // perhitunganKelvin();
                        // perhitunganReamur();
                        // perhitunganFahrenheit();
                      });
                    },
                  ),
                ],
              ),
              Result(result: _result),
              Convert(convertHandler: perhitunganSuhu),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Celcius : ',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Kelvin : ',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Reamur : ',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Fahrenheit : ',
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
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
