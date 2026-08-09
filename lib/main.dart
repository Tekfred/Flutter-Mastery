import 'package:flutter/material.dart';
// import 'question.dart';
import 'quizzbrain.dart';

Quizzbrain quizzbrain = Quizzbrain();

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
  List<Widget> scoreKeeper = [];

  // List<bool> answers = [false, true, true];

  int questionNumber = 0;

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
            Expanded(
              flex: 6, // ← takes 5 parts of available space
              child: Center(
                child: Text(
                  quizzbrain.getQuestionText(questionNumber),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                      onPressed: () {
                        bool correctAnswer = quizzbrain.getQuestionAnswer(questionNumber);

                        setState(() {
                          if (correctAnswer == true) {
                            scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                          } else {
                            scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
                          }
                          if (questionNumber < quizzbrain.questionBankLength - 1) {
                            questionNumber++;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 25),
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
                        bool correctAnswer = quizzbrain.getQuestionAnswer(questionNumber);

                        setState(() {
                          if (correctAnswer == false) {
                            scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                          } else {
                            scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
                          }
                          if (questionNumber < quizzbrain.questionBankLength - 1) {
                            questionNumber++;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 25),
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

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }
}
