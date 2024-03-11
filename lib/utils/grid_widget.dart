import 'package:flutter/material.dart';
import 'package:namer_app/apimodel/question.dart';

class GridWidget extends StatefulWidget {
  final String answer;
  GridWidget({required this.answer});

  @override
  _RunGridWidgetState createState() => _RunGridWidgetState();
}

class _RunGridWidgetState extends State<GridWidget> {
  String? answer = '2';

  @override
  initState() {
    // ignore: avoid_print
    answer = widget.answer;
  }

  Widget build(BuildContext context) {
    const title = 'Accent Rating';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: 2,
          // Generate 100 widgets that display their index in the List.
          children: [
            RadioListTile<String>(
              value: '1',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('1'),
            ),
            RadioListTile<String>(
              value: '2',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('2'),
            ),
            RadioListTile<String>(
              value: '3',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('3'),
            ),
            RadioListTile<String>(
              value: '4',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('4'),
            ),
            RadioListTile<String>(
              value: '5',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('5'),
            ),
            RadioListTile<String>(
              value: '6',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('6'),
            ),
            RadioListTile<String>(
              value: '7',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('7'),
            ),
            RadioListTile<String>(
              value: '8',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('8'),
            ),
            RadioListTile<String>(
              value: '9',
              groupValue: answer,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
              title: const Text('9'),
            ),
          ],
        ),
      ),
    );
  }
}
