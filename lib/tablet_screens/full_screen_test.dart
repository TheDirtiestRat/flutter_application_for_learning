import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

class FullScreenSample extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarCustom(title: "Example Full Screen"),
      body: Expanded(child: Center(
        
        child: Column(
            children: [
              Text("This is a Sample Full Screen"),
              ElevatedButton(onPressed: () {
                print("Going Full Screen");
              }, child: Text("Press to Fullscreen")),
              Text ("To full screen it requires the window_manager package")
            ],
          ),
      ),)
    );
  }
}