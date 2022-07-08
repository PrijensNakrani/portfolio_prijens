import 'package:flutter/material.dart';
import 'package:portfolio_demo/responsive/my_portfolio_app.dart';
import 'package:portfolio_demo/responsive/my_portfolio_tab.dart';
import 'package:portfolio_demo/responsive/my_portfolio_web.dart';
import 'package:portfolio_demo/responsive/responsive_leyout.dart';

class Responsive extends StatelessWidget {
  const Responsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWith = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ResponsiveDemo(
        mobilePort: MyPortfolioApp(),
        desktopPort: MyPortfolioWeb(),
        tabletPort: MyPortFolioTab(),
      ),
    );
  }
}
