import 'package:flutter/material.dart';

class TopBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double height;

  const TopBarCustom ({
    super.key,
    required this.title,
    this.actions,
    this.height = 76.0,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
            padding: EdgeInsets.all(8.0),
            child: AppBar(
              toolbarHeight: height,
              title: Text(title),
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                  bottom: Radius.circular(16),
                ),
              ),
              // actions: [
              //   Padding(
              //     padding: EdgeInsets.only(right: 16),
              //     child: IconButton(
              //       onPressed: () {
              //         debugPrint("Appbar Icon Pressed");
              //       },
              //       icon: Icon(Icons.person),
              //       tooltip: "Go to Persons Screen",
              //     ),
              //   ),
              // ],
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}