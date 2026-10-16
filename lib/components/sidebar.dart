import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/tablet_screens/add_record_screen.dart';
import 'package:flutter_application_for_learning/tablet_screens/home.dart';
import 'package:flutter_application_for_learning/tablet_screens/list_screen.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_application_for_learning/tablet_screens/full_screen_test.dart';
import 'package:flutter_application_for_learning/tablet_screens/textinput_sample.dart';

class SidebarCustom extends StatelessWidget {
  const SidebarCustom({super.key});

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
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 8, bottom: 8),
      child: Container(
        width: 260,
        // color: Colors.blueGrey,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey,

          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Todo Testing",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const Divider(),

            // scroll part
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      type: MaterialType.button,
                      clipBehavior: Clip.antiAlias,

                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: Icon(Icons.home),
                        title: Text("Home"),
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeTablet(),
                              ),
                            );
                            debugPrint("Nothing to pop");
                          }
                        },
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      type: MaterialType.button,
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: Icon(Icons.list),
                        title: Text("List"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListScreenTablet(),
                            ),
                          );
                        },
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      type: MaterialType.button,
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: Icon(Icons.add),
                        title: Text("Add Record"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddRecordScreenTablet(),
                            ),
                          );
                        },
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      type: MaterialType.button,
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: Icon(Icons.add),
                        title: Text("Fullscreen Sample"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenSample(),
                            ),
                          );
                        },
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      type: MaterialType.button,
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: Icon(Icons.input),
                        title: Text("Sample Text Input"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TextinputSample(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // const Spacer(),

            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              type: MaterialType.button,
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.exit_to_app),
                title: Text("Exit App"),
                onTap: () {
                  _closeApplication();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
