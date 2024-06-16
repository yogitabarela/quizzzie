import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionButton extends StatelessWidget{
  const OptionButton({super.key , required this.answerText, required this.tap});
  final String answerText;
  final void Function() tap;

  @override
  Widget build(context){
    return ElevatedButton(
      onPressed: tap,
      style:ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        backgroundColor: const Color.fromARGB(255, 3, 18, 71),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child:Text(answerText,textAlign: TextAlign.center,
      ),
    );
  }
}