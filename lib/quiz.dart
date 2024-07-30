import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String _activeScreenName = 'start-screen';

  void switchScreen() {
    setState(() {
      _activeScreenName = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget activeScreen = _activeScreenName == 'start-screen'
        ? StartScreen(startQuiz: switchScreen)
        : const QuestionScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 101, 39, 176),
          child: activeScreen,
        ),
      ),
    );
  }
}
