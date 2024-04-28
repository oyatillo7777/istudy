import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istudy/screens/cheks/chek.dart';
import 'package:istudy/screens/home/home.dart';
import 'package:istudy/screens/profile/profile.dart';
import 'package:istudy/screens/statistic/statistic.dart';
import 'package:istudy/tools/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List page = [
    const HomePage(),
    const ChekScreen(),
    const StaticticScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.checklist_sharp), label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/chart.svg',
              color: currentIndex == 2
                  ? AppColors.primaryColor
                  : const Color(0xff666E7A),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/img.png'),
            ),
            label: "",
          ),
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
