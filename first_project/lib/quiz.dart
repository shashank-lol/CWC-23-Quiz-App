import 'package:flutter/material.dart';

import './start.dart';
import './questions_screen.dart';
import './questions.dart';
import './result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
    Widget? activeScreen;
    List<String> selectedAnswers = [];

    @override
  void initState() {
    // TODO: implement initState
      activeScreen = Start(switchScreen);
    super.initState();
  }
    void switchScreen() {
      setState(() {
        activeScreen = Questions(selectAnswer);
      });
    }

    void selectAnswer(String ans){
      selectedAnswers.add(ans);
      if(selectedAnswers.length == questions.length){
        setState(() {
          activeScreen = ResultsScreen(selectedAnswers,restartQuiz);
        });
      }
    }

    void restartQuiz(){
      setState(() {
        selectedAnswers = [];
        activeScreen = Questions(selectAnswer);
      });

    }


    @override
    Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 30, 31, 34),

          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
