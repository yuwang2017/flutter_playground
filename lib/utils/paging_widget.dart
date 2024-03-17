import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import '../apimodel/survey.dart';
import '../apimodel/question.dart';
import 'survey_screen.dart';
import 'stateful_survey_screen.dart';

class NumbersPage extends StatefulWidget {
  final Survey survey;
  final int pageIndex;
  const NumbersPage({Key? key, required this.survey, required this.pageIndex})
      : super(key: key);

  @override
  _NumbersPageState createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final int _numPages = 4;
  int _currentPage = 1;
  List<SurveyScreen> pages = [];

  @override
  initState() {
    super.initState();
    setState(() {
      _currentPage = widget.pageIndex;
      for (var i = 0; i < 4; i++) {
        SurveyScreen screen = SurveyScreen(survey: widget.survey, pageIndex: i);
        pages.add(screen);
      }
    });
  }

  void updateSurveyAnswers(String audioFileName, String answer) {
    //Update the answer
    for (SurveyQuestion question in widget.survey.questions) {
      if (question.audioFileName == audioFileName) {
        question.answer = answer;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          // by default, the paginator shows numbers as center content
          numberPages: _numPages,
          initialPage: widget.pageIndex,
          onPageChange: (int index) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StatefulSurveyWidget(
                      survey: widget.survey, pageIndex: index)),
            );
          },
        ),
      ),
    );
  }
}
