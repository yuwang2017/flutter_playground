import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import '../utils/question_widget.dart';
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
    //fetchProducts();
    fetchSurvey();
  }

  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      // Handle error if needed
    }
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
        title: Text('Questions'),
      ),
      body: ListView.builder(
        // this give th length of item
        itemCount: survey.questions.length,
        itemBuilder: (context, index) {
          // here we card the card widget
          // which is in utils folder
          return QuestionWidget(
              question: survey.questions[index],
              audioPlayer: audioPlayers[index]);
        },
      ),
    );
  }
}
