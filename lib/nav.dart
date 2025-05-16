// nav.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'setting.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    Home(),
    Chat(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     

      bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.shifting,

        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex=value;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
            backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 30),
            label: 'Chat',
            backgroundColor: Colors.tealAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: 'Setting',
            backgroundColor: Colors.pink
          ),
        ],
      ),
  
      body: screens[selectedIndex],  
    );
  }
}
