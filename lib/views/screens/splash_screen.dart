import 'dart:math';
import 'package:animation/utils/route_uils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

class Intro_page extends StatefulWidget {
  const Intro_page({super.key});

  @override
  State<Intro_page> createState() => _Intro_pageState();
}

class _Intro_pageState extends State<Intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),child: Stack(
        children: [
          Transform.rotate(
            angle: pi / 2,
            child: Center(
              child: Container(
                height: 800,
                width: 1000,
                child: Transform.scale(
                  scale: 2,
                  child: Image.asset(
                    "lib/views/assets/bg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("lib/views/assets/logo.png",width: 250,)),
              SizedBox(height: 50,),
              Text("Planeto",style: GoogleFonts.akshar(fontSize: 65,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              SlideAction(outerColor: Colors.white,
                innerColor: Colors.black,
                text:"Dive in the app",
               submittedIcon: Icon(Icons.light_mode_rounded,color: Colors.black,),
               onSubmit: (){
                Navigator.of(context).pushNamed(Myroutes.home);
               },
              ),
            ],
          ),
        ],
      ),),
    );
  }
}
