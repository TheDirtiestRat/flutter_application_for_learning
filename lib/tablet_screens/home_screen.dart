import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/sidebar.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';


class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: TopBarCustom(title: "Home Screen"),

        body: Row(
          children: [
            SidebarCustom(),
            Expanded(
              child: Center(
                child: Text(
                  "This is A Home Screen for tablets",
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
      ),
    );
  }
}
