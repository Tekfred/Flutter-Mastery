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

  void buildKey() {
    Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ), 
        onPressed: () => soundPlay(1),
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
            buildKey(),

            buildKey(),

            buildKey(),

            buildKey(),

            buildKey(),
            
            buildKey(),

            buildKey(),
          ],
        ),
      ),
    );
  }
}
