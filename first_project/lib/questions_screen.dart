import 'package:first_project/answer_button.dart';
import 'package:flutter/material.dart';
import './questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.selectAnswer, {super.key});

  final void Function(String answer) selectAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var _questionNum = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.selectAnswer(answer);
      _questionNum++;
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleFonts.config.allowRuntimeFetching = true;
    final currQues = questions[_questionNum];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQues.question,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ...currQues.shuffleList().map(
              (ans) {
                return AnswerButton(
                  text: ans,
                  onPress: () {
                    answerQuestion(ans);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
