import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberIcon extends StatelessWidget {
   NumberIcon(this.number, this.isCorrect,{super.key});

  final int number;
  final bool isCorrect;

  final Color correct = Colors.green;
  final Color incorrect = Colors.red;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    if(isCorrect){
      buttonColor = correct;
    }
    else{
      buttonColor = incorrect;
    }
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: buttonColor),
        child: Center(
          child: Text(
            number.toString(),
            style: GoogleFonts.inter(
                color: Colors.white70, fontWeight: FontWeight.w800, fontSize: 12),
          ),
        ));
  }
}
