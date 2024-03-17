import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apimodel/question.dart';
import '../apimodel/survey.dart';
import 'header_widget.dart';
import '../utils/instruction_widget.dart';
import "paging_widget.dart";

class StatefulSurveyWidget extends StatefulWidget {
  Survey survey;
  final int pageIndex;
  StatefulSurveyWidget({
    required this.survey,
    required this.pageIndex,
  });

  @override
  _StatefulSurveyState createState() => _StatefulSurveyState();
}

class _StatefulSurveyState extends State<StatefulSurveyWidget> {
  @override
  void initState() {
    super.initState();
    // fetchSurvey();
  }

  void updateSurveyAnswers(String audioFileName, String answer) {
    //Update the answer
    for (SurveyQuestion question in widget.survey.questions) {
      if (question.audioFileName == audioFileName) {
        question.answer = answer;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int _initailTab = 1;
    if (widget.pageIndex == 0) {
      _initailTab = 0;
    }
    return MaterialApp(
      // add tabBarTheme
      home: DefaultTabController(
        length: 2,
        initialIndex: _initailTab,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: HeaderWidget(),
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
                // child: SurveyScreen(
                //   survey: survey,
                //),
                child: NumbersPage(
                  survey: widget.survey,
                  pageIndex: widget.pageIndex,
                ),
              ),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}
