import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/Chart.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 400,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: const Color.fromARGB(255, 5, 247, 192),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(3, 3),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),

                child: Center(
                  child: Text("Pie Chart",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChartCon(varaibleName: "-200", topic: "Aylık Gider:",rgbA: 221, rgbB: 13 , rgbC: 13),
                  ChartCon(varaibleName: "+300", topic: "Aylık Kazanç:",rgbA: 26, rgbB: 207 , rgbC: 56),
                ],
              ),
          ],
        ),
      )
      );
    }
}