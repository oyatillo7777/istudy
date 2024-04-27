import 'package:flutter/material.dart';
import 'package:istudy/screens/home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex=0;
  List page=[
    HomePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.checklist_sharp),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.charging_station),label: ""),
        ],
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
