import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(
    MaterialApp(
      title: 'Xylophone',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  _playAudio(int audioNumber) async {
    final audioPlayer = AudioCache();
    audioPlayer.play('note$audioNumber.wav');
  }

  Expanded _buildKey(Color color, int soundNumber) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        color: color,
        enableFeedback: false,
        onPressed: () => _playAudio(soundNumber),
      ),
    );
  }

  List<Widget> _buildKeys() {
    return [
      _buildKey(Colors.red, 1),
      _buildKey(Colors.orange, 2),
      _buildKey(Colors.yellow, 3),
      _buildKey(Colors.green, 4),
      _buildKey(Colors.green.shade800, 5),
      _buildKey(Colors.blue, 6),
      _buildKey(Colors.purple, 7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: currentOrientation == Orientation.portrait
          ? Column(
              children: _buildKeys(),
              crossAxisAlignment: CrossAxisAlignment.stretch,
            )
          : Row(
              children: _buildKeys(),
              crossAxisAlignment: CrossAxisAlignment.stretch),
    );
  }
}
