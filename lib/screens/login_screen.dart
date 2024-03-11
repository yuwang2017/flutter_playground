import 'package:flutter/material.dart';
import '../utils/survey_widget.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // this is the coloumn
          children: [
            Container(
                width: 600,
                height: 400,
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter User ID',
                    ),
                  ),
                )),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
    );
  }
}
