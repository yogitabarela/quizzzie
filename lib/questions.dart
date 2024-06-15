import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  @override
  Widget build(context) {
    return SizedBox(
      width:double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('what Questions'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('option 1'),
          ),
        ],
      ),
    );
  }
}
