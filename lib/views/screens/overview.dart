import 'dart:math';

import 'package:animation/controllers/planet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/route_uils.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with TickerProviderStateMixin{

  late TabController T_controller;
  late AnimationController a_controller;
  late Animation<double> animation;
  late Animation opacity;
  late Animation position;

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

    int index=ModalRoute.of(context)!.settings.arguments as int;

    return Consumer<Planets>(
      builder: (context,p,_) {
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
              Center(
                child: SingleChildScrollView(
                  child: AnimatedBuilder(
                    animation: a_controller,
                    builder: (context, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 170,
                        ),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  height: 400,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${p.All_Planet[index].name}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("${p.All_Planet[index].type}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      Text("${p.All_Planet[index].description}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                  child: Hero(
                    tag: index,
                      child: Image.network("${p.All_Planet[index].image}",width: 200,))),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      title: Text("Choose Your 3D Model"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(
                                      Myroutes.planet,
                                      arguments: index);
                                },
                                icon: Icon(Icons.sunny)),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed(
                                      Myroutes.model,
                                      arguments: index);
                                },
                                icon: Icon(Icons.circle))
                          ],
                        ),
                      ],
                    )),
              );
            },
            child: Icon(Icons.circle),
          ),
        );
      }
    );
  }
}
