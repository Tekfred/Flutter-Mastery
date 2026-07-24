import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QiuzTnF(),
    );
  }
}

class QiuzTnF extends StatefulWidget {
  const QiuzTnF({super.key});

  @override
  State<QiuzTnF> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<QiuzTnF> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,

        // ===== APP BAR =====
        appBar: AppBar(
          title: const Text('Quiz TnF'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.black,
        ),

        // ===== BODY — everything goes here =====
        body: Column(
          children: [
            // QUESTION TEXT — takes up most of the screen
            Expanded(
              flex: 6, // ← takes 5 parts of available space
              child: Center(
                child: const Text(
                  'This is where the question text will go',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // TRUE / FALSE BUTTONS — sits at the bottom
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  // TRUE BUTTON
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // sharp corners
                        ),
                      ),
                      child: const Text('True', style: TextStyle(fontSize: 18)),
                    ),
                  ),

                  // FALSE BUTTON
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // sharp corners
                        ),
                      ),
                      child: const Text(
                        'False',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
