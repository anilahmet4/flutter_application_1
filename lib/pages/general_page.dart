import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/graphs_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/data_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int currentIndex = 1;

  final screens = [
    const DataPage(),
    const HomePage(),
    const GraphsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            size: 30, // Set the icon size here
          ),
          onPressed: () {
          // Action for the button
          // For example, navigate to the profile page
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        ),
        title: const Text("Finance Assistant"),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        showUnselectedLabels: false,

        currentIndex: currentIndex, //Indexe göre seçili ikonu parlatıyor
        onTap: (index) => setState(() => currentIndex = index),
        
        items: const [
          //data
          BottomNavigationBarItem(
            icon: Icon(Icons.sd_storage_outlined),
            activeIcon: Icon(Icons.sd_storage),
            label: 'Data',
          ),

          //profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),

          //camera
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_outlined),
            activeIcon: Icon(Icons.auto_graph),
            label:'Graphs',
          ),
        ],
      ),
    );
  }
}