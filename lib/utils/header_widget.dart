import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              '../assets/duke_logo.png',
            ),
          ],
        ),
      ],
    ));
  }
}
