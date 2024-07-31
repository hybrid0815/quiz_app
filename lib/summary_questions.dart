import 'package:flutter/material.dart';

class SummaryQuestions extends StatelessWidget {
  const SummaryQuestions({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (item) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: item['correct_answer'] == item['user_answer']
                          ? const Color.fromARGB(255, 112, 128, 247)
                          : const Color.fromARGB(255, 251, 131, 171),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        (item['question_index'] as int).toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 85, 142),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 142, 144, 234),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
