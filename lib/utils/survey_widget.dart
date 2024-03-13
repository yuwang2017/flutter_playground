import 'package:flutter/material.dart';
import '/screens/api2screen.dart';
import '../utils/header_widget.dart';
import '../utils/instruction_widget.dart';

class SurveyWidget extends StatelessWidget {
  SurveyWidget();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBar(
        title: Text(''),
        flexibleSpace: HeaderWidget(),
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // this is the coloumn
            children: [
              InstructionWidget(),
              Container(
                  width: 800,
                  height: 800,
                  decoration: BoxDecoration(border: Border.all()),
                  child: ProductListScreen()),
            ],
          ),
        ),
      )
    ]);
  }
}
