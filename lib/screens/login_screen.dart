import 'package:flutter/material.dart';
import '../utils/survey_widget.dart';
import '../utils/header_widget.dart';

class LoginWidget extends StatelessWidget {
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
                  decoration: BoxDecoration(border: Border.all()),
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
                  decoration: BoxDecoration(border: Border.all()),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurveyWidget()),
                  );
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
