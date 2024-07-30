# Quize App

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
- 
## Getting Started

