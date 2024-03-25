import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/apimodel/question.dart';
import 'player_widget.dart';
import 'answer_widget.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget();

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);
    String url =
        "https://surveycataudioprocessor.ue.r.appspot.com/getInstructionAudio/Instruction_audio.mp3";
    player.setSourceUrl(url);
    player.stop();

    String instruction1 =
        "Thank you for participating in my study. Please carefully listen to the following instructions. You " +
            "will be asked to determine the strength of non-native accents in a series of audio samples.\n" +
            "Moreover, please read through the following instructions before proceeding:\n\n";
    String q1 =
        " 1. Listen Carefully: You will be presented with an instruction audio followed by a series of audio files containing speech segments. Please listen to each audio file attentively.\n";
    String q2 =
        " 2. Duration: Ensure that you listen to each audio file for at least 10 seconds before making any decisions or responses.\n";
    String q3 =
        " 3. Quiet Environment: Find a quiet and comfortable environment to complete the survey. Minimize background noise to enhance your listening experience.\n";
    String q4 =
        " 4. Headphones Recommended: For the best audio quality and to minimize external distractions, we recommend using headphones or earphones.\n";
    String instrcution2 =
        " Please select the accent Scale, where 1 is “no accent” and 9 is “very strong accent”. Please refer to the audio instrcutions";
    SurveyQuestion question =
        SurveyQuestion(index: 1, audioFileName: "", answer: "1");

    void updateSurveyAnswers(String audioFileName, String answer) {
      //If answer is not 1, display error
      if (answer != "1") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'The accents in this sample audio are from English spoken countries. They are considered as no nonnative accents'),
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
            title: const Text('Correct!'),
            content: const Text(
                'The accents in this sample audio are native accents.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Container(
            width: 300,
            height: 120,
            // decoration: BoxDecoration(border: Border.all()),
            child: PlayerWidget(player: player),
          ),
          Container(
            width: 900,
            height: 150,
            child: AnswerWidget(
                question: question, methodFromParent: updateSurveyAnswers),
          ),
          Container(
            width: 50,
            height: 50,
            child: Text(''),
          ),
          Container(
              width: 600,
              child: Column(
                children: [
                  Text(
                    instruction1,
                    maxLines: 20,
                  ),
                  Text(q1,
                      maxLines: 3,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(q2,
                      maxLines: 3,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(q3,
                      maxLines: 3,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(q4,
                      maxLines: 3,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(instrcution2,
                      maxLines: 3,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                ],
              )),
        ]),
      ),
    );
  }
}
