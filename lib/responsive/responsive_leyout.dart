import 'package:flutter/material.dart';

class ResponsiveDemo extends StatelessWidget {
  final Widget mobilePort;
  final Widget desktopPort;
  final Widget tabletPort;
  const ResponsiveDemo(
      {required this.mobilePort,
      required this.desktopPort,
      required this.tabletPort});

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 480) {
          return mobilePort;
        } else if (constraints.maxWidth < 768) {
          return tabletPort;
        } else {
          return desktopPort;
        }
      },
    );
  }
}
