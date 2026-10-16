import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/mobile_screens/home.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_application_for_learning/mobile_screens/mobile_crud.dart';
import 'package:flutter_application_for_learning/tablet_screens/textinput_sample.dart';

class BottomBarCustom extends StatelessWidget {
  final double height;

  const BottomBarCustom({super.key, this.height = 75});

  void _closeApplication() {
    if (kIsWeb) {
      debugPrint("Cannot Exit because it is in Web Application");
      return;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      SystemNavigator.pop();
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        bottom: 8,
        right: 8,
      ), // Added right padding for symmetry
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ), // Adjusted padding to fit action components nicely
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.list),
              color: Colors.white,
              tooltip: "Sample Text Input",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextinputSample(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.white,
              tooltip: "Home",
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeMobile(),
                    ),
                  );
                  debugPrint("Nothing to pop");
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.input),
              color: Colors.white,
              tooltip: "CRUD Sample",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CRUDSample(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.door_back_door),
              color: Colors.white,
              tooltip: "Exit App",
              onPressed: () {
                _closeApplication();
              },
            ),
          ],
        ),
      ),
    );
  }
}
