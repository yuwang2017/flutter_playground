import 'question_widget.dart';
import 'package:flutter/material.dart';
import '../apimodel/question.dart';
import '../apimodel/survey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyScreen extends StatefulWidget {
  Survey survey;
  int pageIndex;

  SurveyScreen({
    required this.survey,
    required this.pageIndex,
    // required this.audioPlayers
  });
  @override
  _StatefulSurveyState createState() => _StatefulSurveyState();
}

class _StatefulSurveyState extends State<SurveyScreen> {
  List<SurveyQuestion> questions = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      questions.clear();
      for (var i = 0; i < 5; i++) {
        questions.add(widget.survey.questions[widget.pageIndex * 5 + i]);
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

  void saveSurvey() {
    saveSurveyAPI();
  }

  void submitSurvey() {
    submitSurveyAPI();
  }

  Future<http.Response> saveSurveyAPI() async {
    var url = 'https://surveycataudioprocessor.ue.r.appspot.com/saveSurvey';
    //encode Map to JSON
    var body = json.encode(widget.survey);
    print(body);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('The Survey is saved'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to save survey. Please try later'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return response;
  }

  Future<http.Response> submitSurveyAPI() async {
    var url = 'https://surveycataudioprocessor.ue.r.appspot.com/submitSurvey';
    //encode Map to JSON
    var body = json.encode(jsonEncode(widget.survey));
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('The Survey is submitted'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to submit survey. Please try later'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    //Create sublist of questions;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
        itemCount: questions.length,
        itemBuilder: (context, index) {
          // here we card the card widget
          // which is in utils folder
          return WrapQuestionWidget(
            question: questions[index],
            methodFromParent: updateSurveyAnswers,
          );
        },
      ),
    );
  }
}
