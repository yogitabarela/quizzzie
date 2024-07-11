import 'package:flutter/material.dart';
import 'package:quizzzie/data/ques_data.dart';
import 'package:quizzzie/question_history.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenOpt,
    required this.onRestart,
  });

  final List<String> chosenOpt;
  final void Function() onRestart;

  List<Map<String, Object>> quizHistory() {
    final List<Map<String, Object>> history = [];

    assert(chosenOpt.length == questions.length);

    for (var i = 0; i < questions.length; i++) {
      history.add({
        'question_index': i+1,
        'question': questions[i].text,
        'correct_answer': questions[i].options[0],
        'user_answer': chosenOpt[i],
      });
    }

    return history;
  }

  @override
  Widget build(BuildContext context) {
    final historyData = quizHistory();
    // final numTotalQ = questions.length;

    // final numCorrectQ = historyData.where((data) => data['user_answer'] == data['correct_answer']).length;

    return Padding(
      //return SizedBox(
      // width: double.infinity,

      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            // 'You have answered $numCorrectQ out of $numTotalQ questions correctly in this quiz.',
            // 'You have answered 8 out of 8 questions correctly in this quiz.',
            'You have answered ${historyData.where((data) => data['user_answer'] == data['correct_answer']).length} out of ${questions.length} questions correctly in this quiz.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 204, 196, 249)),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: historyData.map(
                  (data) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data['question_index']}. ${data['question']}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize:18),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Your Answer: ${data['user_answer']}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Text(
                                  'Correct Answer: ${data['correct_answer']}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz',
            style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
