import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/scr/model/user_model.dart';
import 'package:parent_control/scr/ui/main/alerts/alerts_screen.dart';
import 'package:parent_control/scr/ui/main/home/child_screen.dart';
import 'package:parent_control/scr/ui/main/setting/setting_screen.dart';
import 'package:parent_control/scr/ui/main/task/task_screen.dart';

UserModel activeUser = UserModel(name: "", gender: "", image: "");

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        const TaskScreen(),
        const AlertsScreen(),
        const SettingScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        selectedLabelStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Color(0xFF0051EE),
            letterSpacing: 0.5),
        unselectedLabelStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFF5CA3E1),
            letterSpacing: 0.5),
        backgroundColor: const Color(0xFFABD6FF),
        selectedItemColor: const Color(0xFF0051EE),
        unselectedItemColor: const Color(0xFF5CA3E1),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: _selectedIndex == 0
                  ? const Color(0xFF0051EE)
                  : const Color(0xFF5CA3E1),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/tasks.svg",
              color: _selectedIndex == 1
                  ? const Color(0xFF0051EE)
                  : const Color(0xFF5CA3E1),
            ),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/alerts.svg",
              color: _selectedIndex == 2
                  ? const Color(0xFF0051EE)
                  : const Color(0xFF5CA3E1),
            ),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/setting.svg",
              color: _selectedIndex == 3
                  ? const Color(0xFF0051EE)
                  : const Color(0xFF5CA3E1),
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
