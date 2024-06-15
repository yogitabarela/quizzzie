import 'package:flutter/material.dart';

import 'package:quizzzie/start_screen.dart';
import 'package:quizzzie/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen='start-screen';// second // another approach 
 
  // Widget? activeScreen ;

  
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }// second // another approach
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
    Widget screenWidget =StartScreen(switchScreen);// other approach

    if(activeScreen=='question-screen'){
      screenWidget=const QuestionsScreen();
    }// other
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 58, 8, 146),
                Color.fromARGB(255, 128, 59, 188),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen, one approach
          // child: activeScreen=='start-screen' 
          // ? StartScreen(switchScreen) 
          // : const  QuestionsScreen(), second approach
          child: screenWidget,// another approach
        ),
      ),
    );
  }
}
