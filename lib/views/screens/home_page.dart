import 'dart:math';

import 'package:animation/controllers/planet_provider.dart';
import 'package:animation/utils/route_uils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with TickerProviderStateMixin {
  late AnimationController a_controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    animation = CurvedAnimation(parent: a_controller, curve: Curves.easeIn);
    a_controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    a_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Planets>(builder: (context, p, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Planets"),
          centerTitle: true,
        ),
        body: ListWheelScrollView(
          magnification: 3,
          itemExtent: 1000,
          children: List.generate(
              p.All_Planet.length,
              (index) => Container(
                    height: 300,
                    width: 200,
                    child: Transform.scale(
                        scale: 1.5,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(Myroutes.details,
                                  arguments: index);
                            },
                            child: RotationTransition(
                                turns: animation,
                                child: Image.network(
                                  "${p.All_Planet[index].image}",
                                  width: 250,
                                )))),
                  )),
        ),
      );
    });
  }
}
