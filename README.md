# Quize App
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-31 at 13 53 28](https://github.com/user-attachments/assets/47d3e6c4-2adc-4c3e-8008-bf43020a52e4)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-31 at 13 53 35](https://github.com/user-attachments/assets/e9aedf6a-2d5f-4f1d-96d1-813752de9b60)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-31 at 13 53 44](https://github.com/user-attachments/assets/f19f4b94-5807-470e-a833-b75685f61d50)

## List of Things to Know
- Render Content Conditionally
- Lifting State Up

> [!NOTE]
> Lifting State Up란 스테이트를 변경하는 함수를 자식 위젯에 콜백함수로 넘겨 자식 위젯에서 부모의 스테이트를 변경 할수 있게 하는 방법 중 하나이다.

> [!IMPORTANT]
> 클래스 내부에서 다른 클래스를 초기화 할때 현재 클래스의 변수를 넣어 초기화 해야 하는 경우 현재 클래스가 초기화 되어 있지 않은 생태 이기 때문에 바로 다른 클래스를 초기화 하면서 변수로 넣을수 없다.
`initState()` 함수는 `build()` 함수 이전에 실행 된다.

```dart
Widget? _activeScreen;

@override
void initState() {
    super.initState();
    _activeScreen = StartScreen(startQuiz: switchScreen);
}

void switchScreen() {
    setState(() {
        _activeScreen = const QuestionScreen();
    });
}
```

> [!IMPORTANT]
> 다른 방법으로는 `build` 함수 내부에서 인스턴스 생성(클래스 초기화)를 하면 현재 클래스 멤버나 멤버함수를 파라미터로 넘길수 있다.

```dart
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
```

## Widgets
- MatrialaApp
- Scaffold
- Container
- Column
- Image.asset
- SizedBox
- Text
- OutlinedButton.icon
- Opacity
- GoogleFonts
- Expanded
- SingleChildScrollView


## Using "if" Statements In Lists

```dart
final myList = [
  1,
  2,
  if (condition)
    3
];

final myList = [
  1,
  2,
  if (condition)
    3
  else
    4
];

final myList = [
  1,
  2,
  condition ? 3 : 4
];
```

## Data
- 데이터의 대표적인 형태는 리스트 딕셔너리 이다.
```dart
List<Map<String, Object>>
```

- 하나의 데이터를 다루기 위해서는 데이터 클래스를 만든다.

```dart
class Question {
  final String question;
  final List<String> answers;

  const Question(this.question, this.answers);
}
```

- 하나의 데이터를 표현하는 위젯을 만든다.
- 이 위젯을 리스트로 포함하는 리스트 위젯을 만든다.

## Spreading Values(...)
```dart
const numbers = [1, 2, 3];

const moreNumbers1 = [numbers, 4]; # [[1, 2, 3], 4]

const moreNumbers2 = [...numbers, 4]; # [1, 2, 3, 4]
```

## List.map()

```dart
List<Widget> buildAnswerButtons1(List<String> answers) {
  List<Widget> listWidget = [];
  for (String answer in answers) {
    final Widget widget = AnswerButton(answerText: answer, onPressed: () {});
    listWidget.add(widget);
  }
  return listWidget;
}

List<Widget> buildAnswerButtons2(List<String> answers) {
  return answers.map((answer) {
    return AnswerButton(answerText: answer, onPressed: () {});
  }).toList();
}
```

## List Copy & Shuffle
```dart
final numbers = [1, 2, 3];
final newNumbers = List.of(numbers); # copy
newNumbers.shuffle(); # shuffle
```

## Change Font

```bash
flutter pub add google_fonts
```

## map & for
```dart
for (var item in summaryData)
  Column(
    children: [
      Text(item['question'] as String),
      Text(item['correct_answer'] as String),
      Text(item['user_answer'] as String),
      const SizedBox(height: 30),
    ],
  ),
```

```dart
...summaryData.map((item) {
  return Column(
    children: [
      Text(item['question'] as String),
      Text(item['correct_answer'] as String),
      Text(item['user_answer'] as String),
      const SizedBox(height: 30),
    ],
  );
}),
```

## List.where
```dart
int correctNum = summaryData.where((item) {
      return item['correct_answer'] == item['user_answer'];
    }).length;  
```

## getter
```dart
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
```