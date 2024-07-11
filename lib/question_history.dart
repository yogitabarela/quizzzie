import 'package:flutter/material.dart';

class QuestionsHistory extends StatelessWidget {
  const QuestionsHistory(this.historyData, {super.key});

  final List<Map<String, Object>> historyData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'You have answered ${historyData.where((data) => data['user_answer'] != null).length} out of ${historyData.length} questions in this quiz.',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...historyData.map((data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${(data['question_index'] as int) + 1}. ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Your answer: ${data['user_answer'] ?? 'Not answered'}',
                            style: TextStyle(
                              color: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Correct answer: ${data['correct_answer'] as String}',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
