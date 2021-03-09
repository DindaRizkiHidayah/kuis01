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
        hoverColor: Colors.grey[400],
      onPressed: convertHandler,
      textColor: Colors.black,
      color: Colors.grey[200],
      child: Text("Konversi Suhu", style: TextStyle(fontSize: 15),
      ),
      ),
    );
  }
}