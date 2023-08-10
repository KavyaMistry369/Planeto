import 'dart:convert';

import 'package:animation/modals/planet_image_modals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../modals/planet_modals.dart';

class Planets extends ChangeNotifier {
  List<Planet_Modals> All_Planet = [];
  List<Planet_Image> ALl_Planet_Image = [];

  Planets() {
    load_my_json();
    print("++++++++++++++++++++++++++");
    print("JSON LOADED");

    print("++++++++++++++++++++++++++");
  }

  load_my_json() async {
    String res = await rootBundle.loadString("lib/views/JSON/planet_json.json");
    String respone =
        await rootBundle.loadString("lib/views/JSON/planet_img_json.json");
    List allData = jsonDecode(res);
    List alldata = jsonDecode(respone);
    All_Planet = allData.map((e) => Planet_Modals.fromMap(Data: e)).toList();
    ALl_Planet_Image =
        alldata.map((e) => Planet_Image.fromMap(data: e)).toList();
    notifyListeners();
  }
}
