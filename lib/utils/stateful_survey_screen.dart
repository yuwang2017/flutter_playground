import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apimodel/question.dart';
import '../apimodel/survey.dart';
import 'header_widget.dart';
import '../utils/survey_screen.dart';
import '../utils/instruction_widget.dart';
import "paging_widget.dart";

class StatefulSurveyWidget extends StatefulWidget {
  final String userId;

  StatefulSurveyWidget({
    required this.userId,
  });

  @override
  _StatefulSurveyState createState() => _StatefulSurveyState();
}

class _StatefulSurveyState extends State<StatefulSurveyWidget> {
  Survey survey = new Survey(
      userId: "",
      surveyLot: "",
      startDate: DateTime.now(),
      submitDate: DateTime.now(),
      lastAccessDate: DateTime.now(),
      status: "",
      questions: []);
  @override
  void initState() {
    super.initState();
    fetchSurvey();
  }

  void updateSurveyAnswers(String audioFileName, String answer) {
    //Update the answer
    for (SurveyQuestion question in survey.questions) {
      if (question.audioFileName == audioFileName) {
        question.answer = answer;
      }
    }
    setState(() {});
  }

  Future<void> fetchSurvey() async {
    // you can replace your api link with this link
    final response = await http.get(Uri.parse(
        'https://surveycataudioprocessor.ue.r.appspot.com/getSurvey/' +
            widget.userId));
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      // print(jsonData);
      setState(() {
        survey = Survey.fromJson(jsonData);
        for (SurveyQuestion question in survey.questions) {
          AudioPlayer player = new AudioPlayer();
          player..setReleaseMode(ReleaseMode.stop);
          String url =
              "https://surveycataudioprocessor.ue.r.appspot.com/getAudio/" +
                  question.audioFileName;
          player.setSourceUrl(url);
          player.stop();
        }
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // add tabBarTheme
      home: DefaultTabController(
        length: 2,
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
                child: SurveyScreen(
                  survey: survey,
                ),
                //child: NumbersPage(),
              ),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}
