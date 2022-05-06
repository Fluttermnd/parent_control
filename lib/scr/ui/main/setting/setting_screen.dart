import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/scr/ui/add_child/add_child_screen.dart';
import 'package:parent_control/scr/ui/main/setting/add_service_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool response = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF59AFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF59AFFF),
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 22,
            letterSpacing: 0.5,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 56,
            width: width,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/right.svg")
              ],
            ),
          ),
          Container(
            height: 56,
            width: width,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Term of Use",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/right.svg")
              ],
            ),
          ),
          Container(
            height: 56,
            width: width,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Support",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/right.svg")
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddChildScreen(
                      type: 1,
                    );
                  },
                ),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 56,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFFFFFFF),
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Center(
                child: Text(
                  "Add child",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    color: Color(0xFF0051EE),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddServiceScreen();
                  },
                ),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 56,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFFFFFFF),
                  width: 2,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Center(
                child: Text(
                  "Add service",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
