import 'package:flutter/material.dart';
import '/screens/api2screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'player_widget.dart';

class SurveyWidget extends StatelessWidget {
  SurveyWidget();

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = new AudioPlayer();
    player..setReleaseMode(ReleaseMode.stop);
    String url =
        "https://surveycataudioprocessor.ue.r.appspot.com/getInstructionAudio/Instruction_audio.mp3";
    player.setSourceUrl(url);
    player.stop();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // this is the coloumn
          children: [
            Container(
              width: 800,
              height: 200,
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                  // this is the coloumn
                  children: [
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
                        width: 300,
                        child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                            "Please select the accent Scale, where 1 is “no accent” and 9 is “very strong accent”. Please refer to the audio instrcutions")),
                  ]),
            ),
            const Divider(),
            Container(
                width: 800,
                height: 800,
                decoration: BoxDecoration(border: Border.all()),
                child: ProductListScreen()),
          ],
        ),
      ),
    );
  }
}
