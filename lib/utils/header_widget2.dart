import 'package:flutter/material.dart';

class HeaderWidget2 extends StatelessWidget {
  HeaderWidget2();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/duke_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset('assets/images/faqua_logo.png'),
      ),
    ]);
  }
}
