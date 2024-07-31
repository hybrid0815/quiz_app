import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectAnswer, super.key});

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  // List<Widget> buildAnswerButtons(List<String> answers) {
  //   List<Widget> listWidget = [];
  //   for (String answer in answers) {
  //     final Widget widget = AnswerButton(answerText: answer, onPressed: () {});
  //     listWidget.add(widget);
  //   }
  //   return listWidget;
  // }

  List<Widget> buildAnswerButtons(List<String> answers) {
    return answers.map((answer) {
      return AnswerButton(
        answerText: answer,
        onPressed: () {
          answerQuestion(answer);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 217, 185, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...buildAnswerButtons(currentQuestion.shuffledAnswers),
          ],
        ),
      ),
    );
  }
}
