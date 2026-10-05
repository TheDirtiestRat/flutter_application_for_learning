import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/sidebar.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarCustom(title: "Tablet"),
      body: Row(children: [
        SidebarCustom(),
        Expanded(child: Center(child: Text("Table Content Here.")))
      ],),
    );
  }
}
