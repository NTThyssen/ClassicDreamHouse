import 'package:classic_dream_house_app/services/sharedPreferences.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('save and read value to preferences success', () async {
    SharedPref sharedPref = new SharedPref();

    sharedPref.save("loginUuid", "FWNbkvaMuoCmQScQT0t8");

    var result = await sharedPref.read("loginUuid");
    expect(result, "FWNbkvaMuoCmQScQT0t8");


  });

  test('read sharedPref on null key', () async {
    SharedPref sharedPref = new SharedPref();

    sharedPref.save("loginUuid", "FWNbkvaMuoCmQScQT0t8");

    var result = await sharedPref.read("wrongKey");
    expect(result, null);


  });



}