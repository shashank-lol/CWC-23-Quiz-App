import 'package:first_project/number_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  bool isCorrectAns(Map<String, Object> data){
    String correct = data["correct_ans"] as String;
    String chosen = data["user_ans"] as String;
    if(chosen==correct) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumberIcon((data["question_no"] as int)+1,isCorrectAns(data)),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        data["question"] as String,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(data["user_ans"] as String, style: GoogleFonts.inter(color: Colors.white70),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(data["correct_ans"] as String, style: GoogleFonts.inter(color: Colors.lightGreenAccent),),
                    ),
                  ],
                ))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
