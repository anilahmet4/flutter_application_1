import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class DataSetConainer extends StatelessWidget {
  final String dayText;
  final String priceText;
  Function(BuildContext)? deleteFunction;

  DataSetConainer({
    super.key, 
    required this.dayText, 
    required this.priceText,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0, top: 8.0, right: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              spacing: 8,
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5)),
          ), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 130,
                child: Text(dayText, 
                  style: const TextStyle(
                    fontSize: 18,
                  ), 
                ),
              ),
              SizedBox(
                width: 130,
                child: Text(" $priceText",
                  style: const TextStyle(
                    fontSize: 18,
                  ), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}