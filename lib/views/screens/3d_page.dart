import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class model_page extends StatelessWidget {
  const model_page({super.key});

  @override
  Widget build(BuildContext context) {
    int index=ModalRoute.of(context)!.settings.arguments as int;
    List<String>model=[
      "lib/views/assets/Mercury.glb",
      "lib/views/assets/Venus.glb",
      "lib/views/assets/Earth.glb",
      "lib/views/assets/Mars.glb",
      "lib/views/assets/Jupiter.glb",
      "lib/views/assets/Saturn.glb",
      "lib/views/assets/Uranus.glb",
      "lib/views/assets/Neptune.glb",
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModelViewer(src: "${model[index]}"),
    );
  }
}
