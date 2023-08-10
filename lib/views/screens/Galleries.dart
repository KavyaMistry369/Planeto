import 'package:animation/controllers/planet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Planets>(builder: (context, p, _) {
      int ind=ModalRoute.of(context)!.settings.arguments as int;
      return Scaffold(
        body: GridView.builder(
          itemCount: p.ALl_Planet_Image.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              "${p.ALl_Planet_Image[ind].IMG[index]}",
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
  }
}
