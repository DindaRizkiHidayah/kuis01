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
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = List<String>();
  void perhitunganCelcius() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listViewItem.add("$_newValue : $_result");
      } else {
        _result = (9 / 5) * _inputUser + 32;
        listViewItem.add("$_newValue : $_result");
      }
    });
  }

  void perhitunganReamur() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin") {
        _result = (5/4)*_inputUser + 273;
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Celcius") {
        _result = (5/4) * _inputUser;
        listViewItem.add("$_newValue : $_result");
      } else {
        _result = (9 / 4) * _inputUser + 32;
        listViewItem.add("$_newValue : $_result");
      }
    });
  }

  void perhitunganKelvin() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Celcius") {
        _result = _inputUser - 273;
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Reamur") {
        _result = 4/5 * (_inputUser-273);
        listViewItem.add("$_newValue : $_result");
      } else {
        _result = 9 / 5 * (_inputUser-273) +32;
        listViewItem.add("$_newValue : $_result");
      }
    });
  }

  void perhitunganFahrenheit() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Celcius") {
        _result = 5/9 * (_inputUser-32);
        listViewItem.add("$_newValue : $_result");
      } else if (_newValue == "Reamur") {
        _result = 4/9 * (_inputUser-32);
        listViewItem.add("$_newValue : $_result");
      } else {
        _result = 5/9 * (_inputUser-32)+273;
        listViewItem.add("$_newValue : $_result");
      }
    });
  }
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
                        perhitunganFahrenheit();
                      });
                    },
                  ),
                  DropdownButton<String>(
                    items: listItem.map((String value) {
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
                        perhitunganFahrenheit();
                      });
                    },
                  ),
                ],
              ),
              Result(result: _result),
              Convert(convertHandler: perhitunganCelcius ),
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
