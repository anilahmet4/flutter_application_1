import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartCon extends StatelessWidget {
  final String varaibleName;
  final String topic;
  final int rgbA;
  final int rgbB;
  final int rgbC;
  @override

const ChartCon({
  super.key,
  required this.varaibleName,
  required this.topic,
  required this.rgbA,
  required this.rgbB,
  required this.rgbC,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 170,
        height: 125,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(3, 3),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),

        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(topic,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(varaibleName, 
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  color: Color.fromARGB(255, rgbA, rgbB, rgbC),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );  
  }
}

