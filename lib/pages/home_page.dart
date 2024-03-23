import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/utilities/Chart.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<dynamic> homeReceiptsList = [];

  @override 
  void initState() {
    super.initState();
    loadReceiptsFromHive();
    //HiveService.clearAllReceipts();
  }

  Future<void> loadReceiptsFromHive() async {
    final receipts = await HiveService.getAllReceipts();
    setState(() {
      homeReceiptsList = receipts;
    });
  }

  double calculateTotal() {
    return homeReceiptsList.fold<double>(0, (previousValue, element) {
      // Assuming element[1] can be parsed to double. Otherwise, consider handling parsing errors.
      return previousValue + double.parse(element[1].toString());
    });
  }
  
  @override 
  Widget build(BuildContext context) {
    
    double totalAmount = calculateTotal(); // Calculate total sum of receiptsList[1]

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
                      offset: const Offset(3, 3),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChartCon(varaibleName: totalAmount.toStringAsFixed(2), topic: "Aylık Gider:",rgbA: 221, rgbB: 13 , rgbC: 13),
                  const ChartCon(varaibleName: "+300", topic: "Aylık Gelir:",rgbA: 26, rgbB: 207 , rgbC: 56),
                ],
              ),
          ],
        ),
      )
      );
    }
}