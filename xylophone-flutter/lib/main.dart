import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int soundFile) {
    final player = AudioCache();
    player.play('note$soundFile.wav');
  }

  Expanded xylophoneKey({Color color, int soundFile}){
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundFile);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              xylophoneKey(color: Colors.red, soundFile: 1),
              xylophoneKey(color: Colors.orange, soundFile: 2),
              xylophoneKey(color: Colors.yellow, soundFile: 3),
              xylophoneKey(color: Colors.green, soundFile: 4),
              xylophoneKey(color: Colors.teal, soundFile: 5),
              xylophoneKey(color: Colors.blue, soundFile: 6),
              xylophoneKey(color: Colors.purple, soundFile: 7),
            ],
          ),
        ),
      ),
    );
  }
}
