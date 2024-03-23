import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller1;
  final controller2;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 200,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //get user input
            TextField(
              controller: controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Tarih",
              ),
            ),

            TextField(
              controller: controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Tutar",
              ),
            ),
                
            //buttons -> save + cansel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),

                 //cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
            ],
            ),
          ],
        ),
        )
    );
  }
}