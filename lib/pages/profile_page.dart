import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/profile_input_container.dart';

import '../utilities/Chart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              size: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileInputContainer(text1: "Anıl Ahmet ", text2: "Çırak"),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChartCon(varaibleName: "-300", topic: "Toplam Harcama:", rgbA: 255, rgbB: 0, rgbC: 0,),
                ChartCon(varaibleName: "-300", topic: "Toplam Harcama:", rgbA: 255, rgbB: 0, rgbC: 0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}