import 'package:flutter/material.dart';
import '../utils/header_widget.dart';
import '../utils/stateful_survey_screen.dart';
import 'package:http/http.dart' as http;
import '../apimodel/question.dart';
import '../apimodel/survey.dart';
import 'dart:convert';

class LoginWidget extends StatelessWidget {
  String userId = "";
  Survey survey = new Survey(
      userId: "",
      surveyLot: "",
      startDate: DateTime.now(),
      submitDate: DateTime.now(),
      lastAccessDate: DateTime.now(),
      status: "",
      questions: []);

  Future<void> fetchSurvey(BuildContext context) async {
    // you can replace your api link with this link
    final response = await http.get(Uri.parse(
        'https://surveycataudioprocessor.ue.r.appspot.com/getSurvey/' +
            userId));
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      survey = Survey.fromJson(jsonData);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StatefulSurveyWidget(
                  survey: survey,
                  pageIndex: 0,
                )),
      );
    } else {
      // Handle error if needed
    }
  }

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
              Container(
                  width: 600,
                  height: 200,
                  //                               decoration: BoxDecoration(border: Border.all()),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Text(
                        "The main goal of a survey is to collect data that is  representative of the group being surveyed, allowing researchers to make informed decisions or draw conclusions.",
                        maxLines: 3,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black)),
                  )),
              Container(
                  width: 600,
                  height: 100,
                  // decoration: BoxDecoration(border: Border.all()),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    child: TextField(
                        onChanged: (value) => userId = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Prolific ID',
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        )),
                  )),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  if (userId.length == 0) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'Please enter your prolific ID to start the Survey'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    fetchSurvey(context);
                  }
                },
                child: Text('Start Survey'),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
