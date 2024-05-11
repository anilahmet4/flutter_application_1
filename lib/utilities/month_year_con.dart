import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/buttons/month_button.dart';
import 'package:flutter_application_1/utilities/year_row.dart';

class MonthYearCon extends StatefulWidget {
  const MonthYearCon({super.key});

  @override
  State<MonthYearCon> createState() => _MonthYearConState();
}

class _MonthYearConState extends State<MonthYearCon> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: const Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
        
            YearRow(),
            
            SizedBox(height: 10,),

            Row(  //ilk sıra
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonthButton(text: "Jan"),
                MonthButton(text: "Feb"),
                MonthButton(text: "Mar"),
              ],
            ),
        
            Row(  //ikinci sıra
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonthButton(text: "Apr"),
                MonthButton(text: "May"),
                MonthButton(text: "Jun"),
              ],
            ),
        
            Row(  //üçüncü sıra
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonthButton(text: "Jul"),
                MonthButton(text: "Aug"),
                MonthButton(text: "Sep"),
              ],
            ),
        
            Row(  //dördüncü sıra
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonthButton(text: "Oct"),
                MonthButton(text: "Nov"),
                MonthButton(text: "Dec"),
              ],
            )
          ],
        ),
      ),
    );
  }
}