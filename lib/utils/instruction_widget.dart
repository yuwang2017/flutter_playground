import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'player_widget.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget();

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = new AudioPlayer();
    player..setReleaseMode(ReleaseMode.stop);
    String url =
        "https://surveycataudioprocessor.ue.r.appspot.com/getInstructionAudio/Instruction_audio.mp3";
    player.setSourceUrl(url);
    player.stop();

    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Container(
            width: 300,
            height: 150,
            // decoration: BoxDecoration(border: Border.all()),
            child: PlayerWidget(player: player),
          ),
          Container(
            width: 50,
            height: 50,
            child: Text(''),
          ),
          Container(
              width: 450,
              child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  "Please select the accent Scale, where 1 is “no accent” and 9 is “very strong accent”. Please refer to the audio instrcutions")),
        ]),
      ),
    );
  }
}
