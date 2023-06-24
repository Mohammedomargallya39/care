import 'package:flutter/material.dart';
import '../resources/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: secondryColor, width: 1.0),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: mainColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: mainColor,
            label: "Home",
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(
                "assets/bottom/home.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: mainColor,
            label: "Schedule",
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(
                "assets/bottom/schedule.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: mainColor,
            label: "Report",
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(
                "assets/bottom/report.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: mainColor,
            label: "Notification",
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(
                "assets/bottom/Vector.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        selectedFontSize: 12,
        onTap: (index) {
          // setState(() {
          //   switch (index) {
          //     case 0:
          //       Navigator.pushNamed(context, "/home_screen");
          //       break;
          //     case 1:
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (_) => const ProfileScreen(),
          //         ),
          //       );
          //       break;
          //     case 2:
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (_) => const ProfileScreen(),
          //         ),
          //       );
          //       break;
          //   }
          // });
        },
      ),
    );
  }
}
