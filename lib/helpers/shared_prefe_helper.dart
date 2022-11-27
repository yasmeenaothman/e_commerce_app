import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  SharedPreferenceHelper._();
  static SharedPreferenceHelper sharedHelper = SharedPreferenceHelper._();
  SharedPreferences? sharedPreferences;
  initSharedPreferences() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  putString(String key, String value) async{
    bool isPut = await sharedPreferences!.setString(key, value);
    print('is put in sharedPreference? $isPut');
  }
  String? getString(String key) {
    return sharedPreferences!.getString(key);
  }
}