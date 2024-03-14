import '../utils/wrapquestion_widget.dart';
import 'package:flutter/material.dart';
import '../apimodel/question.dart';
import '../apimodel/survey.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyScreen extends StatelessWidget {
  Survey survey;
  List<AudioPlayer> audioPlayers = [];

  SurveyScreen({required this.survey, required this.audioPlayers});

  void updateSurveyAnswers(String audioFileName, String answer) {
    //Update the answer
    for (SurveyQuestion question in survey.questions) {
      if (question.audioFileName == audioFileName) {
        question.answer = answer;
      }
    }
  }

  void saveSurvey() {
    saveSurveyAPI();
  }

  void submitSurvey() {
    submitSurveyAPI();
  }

  Future<http.Response> saveSurveyAPI() async {
    var url = 'https://surveycataudioprocessor.ue.r.appspot.com/saveSurvey';

    //encode Map to JSON
    var body = json.encode(survey);
    print(body);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> submitSurveyAPI() async {
    var url = 'https://surveycataudioprocessor.ue.r.appspot.com/submitSurvey';
    //encode Map to JSON
    var body = json.encode(jsonEncode(survey));
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            'Questions'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  saveSurvey();
                },
                child: Text(
                  'Save Survey',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.0),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  submitSurvey();
                },
                child: Text(
                  'Submit Survey',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.0),
                ),
              )),
        ],
      ),
      body: ListView.builder(
        // this give th length of item
        itemCount: survey.questions.length,
        itemBuilder: (context, index) {
          // here we card the card widget
          // which is in utils folder
          return WrapQuestionWidget(
              question: survey.questions[index],
              audioPlayer: audioPlayers[index],
              methodFromParent: updateSurveyAnswers);
        },
      ),
    );
  }
}
