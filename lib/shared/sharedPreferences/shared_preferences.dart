
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences>  initSharedPreferences() async{
  return sharedPreferences = await SharedPreferences.getInstance();
  }


  static dynamic getData({
    required dynamic key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> putData({
    required dynamic key,
    required dynamic value,
  }) {
    if (value is bool) return sharedPreferences.setBool(key, value);
    if (value is double) return sharedPreferences.setDouble(key, value);
    if (value is int) return sharedPreferences.setInt(key, value);
    return sharedPreferences.setString(key, value);
  }


}