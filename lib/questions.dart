import 'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';
// import 'package:flutter/rendering.dart';

import 'package:quizzzie/option_button.dart';
import 'package:quizzzie/data/ques_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,  required this.onSelectOption,});

  final void Function(String option) onSelectOption;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQIndex=0;

  void answerQuestion(String chosenOption){
    // widget.onSelectOption; 
    setState(() {
      currentQIndex++;
    });
    widget.onSelectOption(chosenOption); 
  }

  @override
  Widget build(context) {
    if (currentQIndex >= questions.length) {
      // If all questions have been answered, change to result screen
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   widget.onSelectOption(''); // Trigger state change to result screen
      // });
      return Container(); // Return an empty container as a placeholder
    }
    final currentQuestion= questions[currentQIndex];

    return SizedBox(
      width:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            currentQuestion.text,
            style: GoogleFonts.poppins(
              color:const Color.fromARGB(255, 90, 124, 234),
              fontSize:25,
              fontWeight:FontWeight.bold,
            ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffled().map((option){
            return OptionButton(
              answerText: option ,
              onTap: (){
              answerQuestion(option);
              // widget.onSelectOption(option);
            },
            );
          }),  
        ],
      ),
    );
  }
}
