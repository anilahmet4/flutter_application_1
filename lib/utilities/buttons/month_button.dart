import 'package:flutter/material.dart';

class MonthButton extends StatelessWidget {
  final String text;

  const MonthButton({
    super.key,
    required this.text,
  });

  void saveText() {
    String CurrentMonth = text;
    //String CurrentYear = currentYear;
  }

  @override
  Widget build(BuildContext context) {

    return TextButton(
      
      onPressed: () {
        saveText();
        Navigator.of(context).pop(); 
      },
      
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
    );
  }
}