import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/month_year_con.dart';
import 'package:popover/popover.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});


  @override
  State<DateSelector> createState() => _DateSelectorState();
}

String year = "2024";
String month = "May";

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    

    return TextButton(

      onPressed:() => showPopover(
        context: context, 
        bodyBuilder: (context) => const MonthYearCon(),
        width: 290,
        height: 300,
        radius: 30,
        direction: PopoverDirection.bottom,
        
      ),

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white), //Background Color
        elevation: MaterialStateProperty.all(2), //Defines Elevation
        shadowColor: MaterialStateProperty.all(Colors.grey), //Defines shadowColor
      ),

      child: Text(
        "$month $year",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}