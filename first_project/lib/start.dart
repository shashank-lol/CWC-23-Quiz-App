import 'package:flutter/material.dart';

import './quiz.dart';

class Start extends StatelessWidget {
  const Start(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/cwc-logo.png',
            width: 200,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text("Test your World Cup Knowledge",
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(
            height: 72,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white70),
            label: const Text("Start Quiz", style: TextStyle(fontSize: 28)),
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
    );
  }
}
