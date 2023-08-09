import 'dart:math';

import 'package:animation/controllers/planet_provider.dart';
import 'package:animation/utils/route_uils.dart';
import 'package:animation/views/screens/Galleries.dart';
import 'package:animation/views/screens/Numbers.dart';
import 'package:animation/views/screens/depth_page.dart';
import 'package:animation/views/screens/overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({super.key});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page>
    with TickerProviderStateMixin {
  late TabController T_controller;
  late AnimationController a_controller;
  late Animation<double> animation;
  late Animation opacity;
  late Animation position;

  List<String> image = [
    "lib/views/assets/mercury.gif",
    "lib/views/assets/venus.gif",
    "lib/views/assets/earth.gif",
    "lib/views/assets/mars.gif",
    "lib/views/assets/jupiter.gif",
    "lib/views/assets/saturn.gif",
    "lib/views/assets/uranus.gif",
    "lib/views/assets/neptune.gif",
  ];

  @override
  void initState() {
    super.initState();
    a_controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    animation = Tween<double>(begin: 0, end: pi * 2).animate(
      CurvedAnimation(
        parent: a_controller,
        curve: Curves.easeIn,
      ),
    );
    opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: a_controller, curve: Interval(0.0, 0.2)),
    );

    position = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: a_controller, curve: Interval(0.2, 1.0)));

    // a_controller.repeat();
    a_controller.forward();
    T_controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<Planets>(builder: (context, p, _) {
      return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              tabs: [
            Tab(
              text: "Overview",
            ),
            Tab(
              text: "In Depth",
            ),
            Tab(
              text: "Numbers",
            ),
            Tab(
              text: "Galleries",
            ),
          ],
            controller: T_controller,
          ),
        ),
        body: TabBarView(
          controller: T_controller,
          children: [
            Overview(),
            InDepth(),
            Number(),
            Gallery(),
          ],
        )
      );
    });
  }
}
