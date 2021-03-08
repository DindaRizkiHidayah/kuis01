import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key, this.convertHandler,
  }) : super(key: key);
final Function convertHandler;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:RaisedButton(
        hoverColor: Colors.red,
      onPressed: convertHandler,
      textColor: Colors.white,
      color: Colors.grey,
      child: Text("Konversi Suhu", style: TextStyle(fontSize: 15)
      ),
      ),
    );
  }
}