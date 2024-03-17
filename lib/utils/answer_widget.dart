import 'package:flutter/material.dart';
import 'package:namer_app/apimodel/question.dart';

class AnswerWidget extends StatefulWidget {
  SurveyQuestion question;
  final Function(String val1, String val2)? methodFromParent;
  AnswerWidget({
    required this.question,
    required this.methodFromParent,
  });

  @override
  _RunGridWidgetState createState() => _RunGridWidgetState();
}

class _RunGridWidgetState extends State<AnswerWidget> {
  String? answer = '';

  @override
  initState() {
    super.initState();
    answer = widget.question.answer;
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Accent Rating';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 9,
          shrinkWrap: true,
          childAspectRatio: 0.6,
          children: [
            Column(children: [
              RadioListTile<String>(
                  value: '1',
                  groupValue: answer,
                  onChanged: (value) {
                    widget.methodFromParent
                        ?.call(widget.question.audioFileName, "$value");
                    setState(() {
                      answer = value;
                    });
                  },
                  title: const Text('1'),
                  tileColor: Colors.blueGrey),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text("No nonnative accent"),
              ),
            ]),
            RadioListTile<String>(
              value: '2',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('2'),
              tileColor: Colors.blueGrey,
            ),
            RadioListTile<String>(
              value: '3',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('3'),
              tileColor: Colors.blueGrey,
            ),
            RadioListTile<String>(
              value: '4',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('4'),
              tileColor: Colors.blueGrey,
            ),
            RadioListTile<String>(
              value: '5',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('5'),
              tileColor: Colors.blueGrey,
            ),
            RadioListTile<String>(
              value: '6',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('6'),
              tileColor: Colors.blueGrey,
            ),
            RadioListTile<String>(
              value: '7',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('7'),
              tileColor: Colors.blueGrey,
            ),
            RadioListTile<String>(
              value: '8',
              groupValue: answer,
              onChanged: (value) {
                widget.methodFromParent
                    ?.call(widget.question.audioFileName, "$value");
                setState(() {
                  answer = value;
                });
              },
              title: const Text('8'),
              tileColor: Colors.blueGrey,
            ),
            Column(children: [
              RadioListTile<String>(
                  value: '9',
                  groupValue: answer,
                  onChanged: (value) {
                    widget.methodFromParent
                        ?.call(widget.question.audioFileName, "$value");
                    setState(() {
                      answer = value;
                    });
                  },
                  title: const Text('9'),
                  tileColor: Colors.blueGrey),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text("Very stong nonnative accent"),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
