import 'package:flutter/material.dart';

class YearRow extends StatefulWidget {
  const YearRow({super.key});

  @override
  State<YearRow> createState() => _YearRowState();
}

class _YearRowState extends State<YearRow> {
  late int currentYear;

  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year; // Initialize currentYear with the current year
  }

  void decrementYear() {
    setState(() {
      currentYear--; // Decrement the year when called
    });
  }

  void replicationYear() {
    if(currentYear < DateTime.now().year){
      setState(() {
        currentYear++; // Increasing the year when called
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1)),
      ),
      width: 230,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          GestureDetector( //first gesture
            onTap: decrementYear,
            child: const SizedBox(width: 50, height: 50, child: Icon(Icons.arrow_back_ios))
          ),

          TextButton(
            onPressed: null,
            child: Text(
              currentYear.toString(),   //yılın gösterildiği text
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ),

          GestureDetector( //first gesture
            onTap: replicationYear,
            child: const SizedBox(width: 50, height: 50, child: Icon(Icons.arrow_forward_ios))
          ),
        ],
      ),
    );
  }
}