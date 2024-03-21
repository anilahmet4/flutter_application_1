import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/general_page.dart';
import 'package:google_fonts/google_fonts.dart';

//Selamlar, commit al lütfen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const GeneralPage(),
    );
  }
}
