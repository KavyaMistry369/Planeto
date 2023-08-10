import 'package:animation/controllers/planet_provider.dart';
import 'package:animation/utils/route_uils.dart';
import 'package:animation/views/screens/3d_page.dart';
import 'package:animation/views/screens/Galleries.dart';
import 'package:animation/views/screens/Numbers.dart';
import 'package:animation/views/screens/depth_page.dart';
import 'package:animation/views/screens/detail_page.dart';
import 'package:animation/views/screens/home_page.dart';
import 'package:animation/views/screens/overview.dart';
import 'package:animation/views/screens/planet_model.dart';
import 'package:animation/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Planets(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => Intro_page(),
        Myroutes.home:(context) => Home_Page(),
        Myroutes.details: (context) => Details_Page(),
        Myroutes.model: (context) => model_page(),
        Myroutes.planet: (context) => Planet_Model(),
        Myroutes.Depth:(context) => InDepth(),
        Myroutes.Numbers:(context) => Number(),
        Myroutes.Galleries:(context) => Gallery(),
        Myroutes.Basic:(context) => Overview(),
      },
    );
  }
}
