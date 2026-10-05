import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/buttom_bar.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';
import 'package:flutter_application_for_learning/mobile_screens/mobile_crud.dart';

// 1. Cleaned up the Widget name
class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

// 2. Cleaned up the State class name
class _MobileHomeScreenState extends State<MobileHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "This is A Home Screen for Mobiles",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ],
    ),
    const CRUDSample(),
    const Center(child: Text("User Profile", style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarCustom(title: "Mobile Home Screen"),

      // 3. Replaced _pages[_selectedIndex] with IndexedStack
      // This preserves the state/scroll position of your tabs!
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: CustomBottomNav(currentIndex: _selectedIndex, onTap: _onItemTapped)
    );
  }
}