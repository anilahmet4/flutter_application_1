import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/utilities/chartcon.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application_1/utilities/userinputpopup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<dynamic> homeReceiptsList = [];

  List<Color> sectionColors = [
    const Color.fromARGB(255, 26, 207, 56),
    const Color.fromARGB(255, 221, 13, 13),
  ];
  
  List<double> valueList = [
    300, 
    100,
  ];

  List<dynamic> percentList = [
    100,
    100,
  ];

  List<String> titleList = [
    "Gelir",
    "Gider",
  ];

  List<PieChartSectionData> piechartSection() {           //pie chart sections
    return List.generate(
      2, 
      (i) {
        return PieChartSectionData(
          color: sectionColors[i],
          value: valueList[i],
          title: "${titleList[i]}\n%${percentList[i]}",                //??value direkt titleList içine alınabilir.
          radius: 150.0,
          titleStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        );
      }
    );
  }

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

  void showCustomDialog(BuildContext context) {
  // Controller to manage the text input

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserInputPopUp();
      },
    );
  }

  @override 
  Widget build(BuildContext context) {
    
    double totalAmount = calculateTotal(); // Calculate total sum of receiptsList
   
    valueList[0] = 300;                   //gelir toplam
    valueList[1] = totalAmount;           //giderler toplam

    double percentList1 = (valueList[0] / (valueList[0] + valueList[1])) * 100;
    percentList[0] = percentList1.round().toDouble();
    double percentList2 = (valueList[1] / (valueList[0] + valueList[1])) * 100;
    percentList[1] = percentList2.round().toDouble();

    return  Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Center(                                           //pie chart container
              child: Container(
                height: 400,
                width: 350,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(3, 3),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),

                child: PieChart(                              //Pie Chart
                  PieChartData(
                    sections: piechartSection(),
                    sectionsSpace: 4,
                    centerSpaceRadius: 0,
                  ),
                ),
              ),
            ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChartCon(varaibleName: totalAmount.toStringAsFixed(2), topic: "Aylık Gider:",rgbA: 221, rgbB: 13 , rgbC: 13),
                  ChartCon(varaibleName: "+300", topic: "Aylık Gelir:",rgbA: 26, rgbB: 207 , rgbC: 56, onTap: () => showCustomDialog(context),),
                ],
              ),
            ],
        ),
      )
    );
  }
}