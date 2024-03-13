import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import '../utils/wrapquestion_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apimodel/product.dart';
import '../apimodel/question.dart';
import '../apimodel/survey.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  List<AudioPlayer> audioPlayers = [];
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
    for (SurveyQuestion question in this.survey.questions) {
      if (question.audioFileName == audioFileName) {
        question.answer = answer;
      }
    }
    setState(() {});
  }

  void saveSurvey() {
    saveSurveyAPI();
  }

  void submitSurvey() {
    submitSurveyAPI();
  }

  Future<http.Response> saveSurveyAPI() async {
    var url = 'https://surveycataudioprocessor.ue.r.appspot.com/saveSurvey';
    print(survey);
    //encode Map to JSON
    var body = json.encode(jsonEncode(survey));

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

  Future<void> fetchSurvey() async {
    // you can replace your api link with this link
    final response = await http.get(Uri.parse(
        'https://surveycataudioprocessor.ue.r.appspot.com/getSurvey/user123'));
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
          //player.play(UrlSource(url));
          audioPlayers.add(player);
        }
      });
    } else {
      // Handle error if needed
    }
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
