import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/bottombar.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarCustom(title: "Mobile"),
      body: Column(
        children: [
          Expanded(child: Center(child: Text("Mobile Content Here."))),
          BottomBarCustom(),
        ],
      ),
    );
  }
}
