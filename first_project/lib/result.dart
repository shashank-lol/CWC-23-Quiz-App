import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './questions.dart';
import './summary.dart';
import './quiz.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.chosenAnswers, this.restartQuiz,{super.key});

  List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; ++i) {
      summary.add({
        "question_no": i,
        "question": questions[i].question,
        "correct_ans": questions[i].answers[0],
        "user_ans": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final summary = getSummary();
    final numOfQuestions = questions.length;
    final numOfCorrectAns = summary.where((element) {
      return element["correct_ans"] == element["user_ans"];
    }).length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Score : $numOfCorrectAns/$numOfQuestions",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Summary(summary),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OutlinedButton.icon(
                onPressed: restartQuiz,
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.blue, elevation: 4),

                label: Text(
                  "Restart Quiz",
                  style: GoogleFonts.inter(fontSize: 20),
                ),
                icon: const Icon(Icons.refresh),
              ),
            )
          ],
        ),
      ),
    );
  }
}
