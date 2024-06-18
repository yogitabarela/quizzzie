import 'package:flutter/material.dart';

import 'package:quizzzie/start_screen.dart';
import 'package:quizzzie/questions.dart';
import 'package:quizzzie/data/quesData.dart';
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
  var activeScreen = 'start-screen'; // second // another approach

  // Widget? activeScreen ;

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  } // second // another approach

  void chooseOption(String option) {
    chosenOptions.add(option);

    if (chosenOptions.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      chosenOptions=[];
      activeScreen = 'questions-screen';
    });
  }

  @override
// void initState() {
//   activeScreen = StartScreen(switchScreen);
//   super.initState();
// }//one approach

// void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }//one approach

  Widget build(context) {
    // Widget screenWidget =activeScreen=='start-screen'
    //       ? StartScreen(switchScreen)
    //       : const  QuestionsScreen();//another approach
    Widget screenWidget = StartScreen(switchScreen); // other approach

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectOption: chooseOption,
      );
    } // other

    if (activeScreen == 'results-screen') {
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
          // child: activeScreen, one approach
          // child: activeScreen=='start-screen'
          // ? StartScreen(switchScreen)
          // : const  QuestionsScreen(), second approach
          child: screenWidget, // another approach
        ),
      ),
    );
  }
}
