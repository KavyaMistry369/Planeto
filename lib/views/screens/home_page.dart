import 'dart:math';
import 'package:animation/controllers/planet_provider.dart';
import 'package:animation/utils/route_uils.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        body: Stack(
          children: [
            Transform.rotate(
              angle: pi / 2,
              child: Center(
                child: Container(
                  height: 800,
                  width: 1000,
                  child: Transform.scale(
                    scale: 1.8,
                    child: Image.asset(
                      "lib/views/assets/bg.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              children: [
                SizedBox(height: 30,),
                CarouselSlider(items:List.generate(p.All_Planet.length, (index) => Transform.scale(
                                       scale: 1,
                                       child: GestureDetector(
                                           onTap: () {
                                             Navigator.of(context).pushNamed(
                                                 Myroutes.details,
                                                 arguments: index);
                                           },
                                           child: RotationTransition(
                                               turns: animation,
                                               child: Hero(
                                                 tag: index,
                                                 child: Image.network(
                                                   "${p.All_Planet[index].image}",
                                                   width: 300,
                                                 ),
                                               )))),
                ), options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.linear
                ),),
                SizedBox(height: 300,),
                Transform.scale(
                  scale: 2.5,
                    child: Image.asset("lib/views/assets/sun.gif")),
              ],
            ),
          ],
        ),
      );
    });
  }
}
