import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../modals/planet_modals.dart';

class Planets extends ChangeNotifier{

  List<Planet_Modals>All_Planet=[];

  Planets(){
    load_my_json();
    print("++++++++++++++++++++++++++");
    print("JSON LOADED");

    print("++++++++++++++++++++++++++");
  }

  load_my_json()async{
    String res= await rootBundle.loadString("lib/views/JSON/planet_json.json");
    List allData=jsonDecode(res);
    All_Planet=allData.map((e) => Planet_Modals.fromMap(Data: e)).toList();
    notifyListeners();
  }

}