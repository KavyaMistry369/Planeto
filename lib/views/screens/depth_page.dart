import 'package:animation/controllers/planet_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InDepth extends StatefulWidget {
  const InDepth({super.key});

  @override
  State<InDepth> createState() => _InDepthState();
}

class _InDepthState extends State<InDepth> {
  @override
  Widget build(BuildContext context) {
    int index=ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<Planets>(
      builder: (context,p,_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("${p.All_Planet[index].data}",style: GoogleFonts.actor(fontSize: 18),),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
