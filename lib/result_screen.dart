import 'package:flutter/material.dart';
import 'package:quizzzie/data/quesData.dart';
import 'package:quizzzie/question_history.dart';


class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenOpt,required this.onRestart,});

  final List<String> chosenOpt;
  final void Function() onRestart;

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
    final historyData=quizHistory();
    final numTotalQ=questions.length;

    //arrow function simply shorter to write instead of ((data){return data['user_answer']==data['correct_answer']})
    final numCorrectQ=historyData.where((data) => data['user_answer']==data['correct_answer']).length;

    return SizedBox(
      width:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You have answered $numCorrectQ out of $numTotalQ questions in this quiz.'),//3 correct out of 6 ques sections
          
          const SizedBox(height: 30,),

          //scrollable section where combination of rows and widgets lie
          QuestionsHistory(historyData),// calls quizHistory to produce a list of maps
                                          
          const SizedBox(height: 30,),

          TextButton.icon(onPressed: onRestart,
          style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
          icon: const Icon(Icons.refresh),
          label: const Text('Restart Quiz'), 
          ),

        ]
      ),
    );
  }
}