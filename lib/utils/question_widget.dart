import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/utils/grid_widget.dart';
import '../apimodel/question.dart';
import 'player_widget.dart';
import 'radio_widget.dart';

class QuestionWidget extends StatelessWidget {
  final SurveyQuestion question;
  final AudioPlayer audioPlayer;

  QuestionWidget({
    required this.question,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // this is the coloumn
          children: [
            Container(
                width: 50,
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    (question.index).toString())),
            Container(
                width: 320,
                height: 150,
                //decoration: BoxDecoration(border: Border.all()),
                child: PlayerWidget(player: audioPlayer)),
            Container(
                width: 10, child: Text(overflow: TextOverflow.ellipsis, "")),
            Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                // child: AnswerWidget(question: question)),
                child: GridWidget(answer: question.answer))
          ],
        ),
      ),
    );
  }
}
