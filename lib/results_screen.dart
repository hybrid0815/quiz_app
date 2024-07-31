import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary_questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.resetQuiz,
    required this.selectedAnswers,
    super.key,
  });

  final void Function() resetQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int totlaNum = questions.length;
    int correctNum = summaryData.where((item) {
      return item['correct_answer'] == item['user_answer'];
    }).length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $correctNum out of $totlaNum questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 217, 185, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SummaryQuestions(summaryData: summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.refresh),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: resetQuiz,
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
