import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //play sound
    void playSound(int noteNumber) {
      final player = AudioPlayer();
      player.play(AssetSource('assets_note$noteNumber.wav'));
    }

    //build buttons
    Expanded buildButton(Color noteColor, int noteNumber) => Expanded(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(noteColor),
            ),
            onPressed: () {
              playSound(noteNumber);
            },
            child: const Text(''),
          ),
        );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Xylophone App'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 17.0,
          ),
          backgroundColor: Colors.white12,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildButton(Colors.red, 1),
              buildButton(Colors.orange, 2),
              buildButton(Colors.yellow, 3),
              buildButton(Colors.green, 4),
              buildButton(Colors.teal, 5),
              buildButton(Colors.blue, 6),
              buildButton(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
