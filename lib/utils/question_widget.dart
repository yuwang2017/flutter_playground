import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../apimodel/question.dart';
import 'player_widget.dart';
import 'answer_widget.dart';

class WrapQuestionWidget extends StatefulWidget {
  final SurveyQuestion question;
  //final AudioPlayer audioPlayer;
  final Function(String val1, String val2)? methodFromParent;
  WrapQuestionWidget({
    required this.question,
    //  required this.audioPlayer,
    required this.methodFromParent,
  });

  @override
  _StatefulQuestionState createState() => _StatefulQuestionState();
}

class _StatefulQuestionState extends State<WrapQuestionWidget> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  void updateSurveyAnswers(String audioFileName, String answer) {
    widget.methodFromParent?.call(audioFileName, answer);
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    String url = "https://surveycataudioprocessor.ue.r.appspot.com/getAudio/" +
        widget.question.audioFileName;
    audioPlayer.setSourceUrl(url);
    audioPlayer.stop();
    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(children: <Widget>[
          Container(
              width: 50,
              child: Text(
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                  overflow: TextOverflow.ellipsis,
                  (widget.question.index).toString())),
          Container(
              width: 320,
              height: 150,
              child: PlayerWidget(player: audioPlayer)),
          Container(
              width: 10, child: Text(overflow: TextOverflow.ellipsis, "")),
          Container(
              width: 900,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blueAccent,
              ),
              child:
                  //GridWidget(
                  AnswerWidget(
                      question: widget.question,
                      methodFromParent: updateSurveyAnswers))
        ]),
      ),
    );
  }
}
