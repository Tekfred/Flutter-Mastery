import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: XylophoneApp());
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  // 1. VARIABLE
  final player = AudioPlayer();

  // 2. FUNCTION ✅ correct syntax now
  void soundPlay(int soundNumber) {
    player.play(AssetSource('Sounds/note$soundNumber.wav'));
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
        onPressed: () => soundPlay(soundNumber),
        child: const Text('Click Me'),
      ),
    );
  }

  // 3. DISPOSE
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  // 4. BUILD
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, soundNumber: 1),

            buildKey(color: Colors.orange, soundNumber: 2),

            buildKey(color: Colors.yellow, soundNumber: 3),

            buildKey(color: Colors.green, soundNumber: 4),

            buildKey(color: Colors.blue, soundNumber: 5),

            buildKey(color: Colors.indigo, soundNumber: 6),
            
            buildKey(color: Colors.purple, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
