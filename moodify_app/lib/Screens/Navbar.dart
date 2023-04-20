//navigation bar view



import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moodify_app/Screens/EmotionCalender.dart';
import 'package:moodify_app/Screens/InputScreen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    InputScreen(),
    CalenderScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOptions[selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
            onTap: _onItemTapped,
            elevation: 1,
            showSelectedLabels: false,
            selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ),
            unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, ),
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            selectedItemColor: Color.fromARGB(255, 0, 50, 91),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Color.fromARGB(255, 110, 125, 146),
                  iconSize: 32,
             items: [
                    BottomNavigationBarItem(
                    icon: Icon(Icons.question_mark),
                    label: 'Mood Input',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.event_note),
                    label: 'Mood Log',
                  ),
                  ],
                ),
              );
            
        }
  }

