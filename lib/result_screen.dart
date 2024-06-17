import 'package:flutter/material.dart';
import 'package:quizzzie/data/quesData.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenOpt});

  final List<String> chosenOpt;

  List<Map<String,Object>> quizHistory(){
    final List<Map<String,Object>> history=[];

    for(var i = 0; i<chosenOpt.length;i++){
      history.add({
        'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].options[0],
          'user_answer': chosenOpt[i],
      });
    }

    return history;
  }

  @override 
  Widget build (context){
    return SizedBox(
      width:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('hello'),//3 correct out of 6 ques sections
          const SizedBox(height: 30,),
          const Text('the bell'),//scrollable section
          const SizedBox(height: 30,),
          TextButton(onPressed: () {
            
          },
          child: const Text('Restart Quiz') ,)

        ]
      ),
    );
  }
}