import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketButton extends StatelessWidget {
  const TicketButton(
      {required this.heading, required this.description, super.key});

  final String heading;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),boxShadow: [
          BoxShadow(
            color: Color.fromARGB(14, 18, 18, 18),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 12),
              child:  Icon(
                Icons.lightbulb_outline_sharp,
                size: 40,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 16),
                  child: Text(
                    heading,
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    description,
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
