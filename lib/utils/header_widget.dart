import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 200,
        height: 150,
        child: Image.asset('assets/images/duke_logo.jpg'),
      ),
      Container(
        width: 50,
        height: 150,
        child: Text(''),
      ),
      Text(
        "Fuqua School of Business",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30.0),
      ),
    ]);
  }
}
