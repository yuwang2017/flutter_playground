import 'package:flutter/material.dart';
import '/screens/api2screen.dart';
import '../utils/header_widget2.dart';
import '../utils/instruction_widget.dart';

class TabSurveyWidget extends StatelessWidget {
  TabSurveyWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // add tabBarTheme
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: HeaderWidget2(),
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.lime,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.blue),
              tabs: [
                Tab(
                  child: Container(
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("INSTRUCTIONS"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("SURVEY"),
                    ),
                  ),
                ),
              ],
            ), // TabBar
            title: const Text(''),
            backgroundColor: Colors.blue,
          ), // AppBar
          body: TabBarView(
            children: [
              InstructionWidget(),
              Container(
                  width: 800,
                  height: 800,
                  decoration: BoxDecoration(border: Border.all()),
                  child: ProductListScreen()),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}
