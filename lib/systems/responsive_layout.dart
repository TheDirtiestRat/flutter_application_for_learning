import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
  });

  // for the break points
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  // i can add an inbetween but I did not
  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
