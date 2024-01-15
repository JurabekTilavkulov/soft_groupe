

import 'package:hive_flutter/adapters.dart';

class HiveRepository {
  var hive = Hive.box("profil");



  saveName(String name){
    hive.put('name',name);
  }


  String getName() {
    return hive.get("name", defaultValue:'');
  }


}