import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
    static String isLoggedIn = 'isLoggedIn';
     static Future setIsLoggedIn(bool loggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(isLoggedIn, loggedIn);
  }

    static Future<bool> isUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isLoggedIn)??false;
  }

   static Future<bool> clearPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}