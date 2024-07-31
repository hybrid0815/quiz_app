import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String _activeScreenName = 'start-screen';

  void switchScreen() {
    setState(() {
      _activeScreenName = 'question-screen';
    });
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      _activeScreenName = 'start-screen';
    });
  }

  void chooserAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreenName = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(startQuiz: switchScreen);

    if (_activeScreenName == 'question-screen') {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooserAnswer,
      );
    }

    if (_activeScreenName == 'results-screen') {
      activeScreen = ResultsScreen(
        resetQuiz: resetQuiz,
        selectedAnswers: selectedAnswers,
      );
    }

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
