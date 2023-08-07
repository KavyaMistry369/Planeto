import 'dart:math';

import 'package:animation/controllers/planet_provider.dart';
import 'package:animation/utils/route_uils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({super.key});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page>
    with SingleTickerProviderStateMixin {
  late AnimationController a_controller;
  late Animation<double> animation;

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

    a_controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<Planets>(builder: (context, p, _) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: Tween<double>(begin: 0, end: pi * 2)
                      .animate(a_controller),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 5),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "lib/views/assets/sun.gif",
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        height: 350,
                        child: Column(
                          children: [
                            Image.asset(
                              "${image[index]}",
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 400,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${p.All_Planet[index].name}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text("${p.All_Planet[index].type}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        Text("${p.All_Planet[index].description}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).pushNamed(Myroutes.model,arguments: index);
        },child: Icon(Icons.circle),),
      );
    });
  }
}
