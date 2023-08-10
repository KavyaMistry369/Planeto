import 'package:animation/controllers/planet_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<Planets>(builder: (context, p, _) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mass",
                                  style: GoogleFonts.actor(fontSize: 18),
                                ),
                                Text(
                                  "${p.All_Planet[index].mass}",
                                  style: GoogleFonts.actor(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Volume",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                "${p.All_Planet[index].volume}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Surface Area",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${p.All_Planet[index].surface}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gravity",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              Text(
                                "${p.All_Planet[index].gravity}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Escape Velocity",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              Text(
                                "${p.All_Planet[index].escapevelocity}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Temperature",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              Text(
                                "${p.All_Planet[index].Temperature}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Time Period",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              Text(
                                "${p.All_Planet[index].period}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Density",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                              Text(
                                "${p.All_Planet[index].Density}",
                                style: GoogleFonts.actor(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
