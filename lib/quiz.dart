import 'package:flutter/material.dart';
import 'package:quizzzie/start_screen.dart';
import 'package:quizzzie/questions.dart';
import 'package:quizzzie/data/ques_data.dart';
import 'package:quizzzie/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> chosenOptions = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseOption(String option) {
    setState(() {
      chosenOptions.add(option);

      if (chosenOptions.length == questions.length) {
        activeScreen = 'results-screen';
      }
    });
  }

  void restartQuiz() {
    setState(() {
      chosenOptions = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectOption: chooseOption,
      );
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenOpt: chosenOptions,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 12, 89),
                Color.fromARGB(255, 19, 198, 156),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
