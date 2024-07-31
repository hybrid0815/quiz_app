class Question {
  final String question;
  final List<String> answers;

  const Question(this.question, this.answers);

  List<String> get shuffledAnswers {
    final List<String> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
