import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {

  read(String key) async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      if(value.getString(key)==null){
        return null;
      }
      else{
        return json.decode(value.getString(key)) ;
      }
    } ) ;
  }

  save(String key, value) async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((val) => val.setString(key, value) ) ;
  }
}