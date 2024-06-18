import 'package:flutter/material.dart';

class QuestionsHistory extends StatelessWidget {
  const QuestionsHistory(this.historyData, {super.key});

  final List<Map<String, Object>> historyData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(// to fix the height if the QuestionsHistory section
      height:300,
      child: SingleChildScrollView(//takes one child and makes it scrollable if it exceeds the boundaries set around it
        child: Column(
          children: historyData.map(//mapping values from the list of maps for widgets in results_Screen
            (data) {
              return Row(
                children: [
                  Text(((data['question_index'] as int) + 1).toString()),// to convert to int then whole as string //we need question index start from 1 and our loop starts from i=0
                  Expanded(//limits the width of inside column widget to screen size.
                    child: Column(
                      children: [
                        Text(data['question'] as String),// to convert to string
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(data['correct_answer'] as String),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),// to convert to list
        ),
      ),
    );
  }
}