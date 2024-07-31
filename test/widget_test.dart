import 'package:flutter/material.dart';

void main() {
  List<Widget> answerButtons = buildAnswerButtons(['A', 'B', 'C', 'D']);
}

List<Widget> buildAnswerButtons(List<String> answers) {
  List<Widget> listWidget = [];
  for (String answer in answers) {
    final Widget widget = Text(answer);
    listWidget.add(widget);
  }
  return listWidget;
}
