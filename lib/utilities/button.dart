import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color.fromARGB(255, 0, 0, 0), 
          width: 1.0
        ), // Border Color and Width
      ),
      child: Text(text,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          color: Colors.black,
          ), 
      ),
    );
  }
}