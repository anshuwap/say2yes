// import 'package:nb_utils/nb_utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Helper {
//   static String valueSharedPreferences = '';
// //   Future<SharedPreferences> getSharedPref() async {
// //     return await SharedPreferences.getInstance();
// //   }
// // Future<bool> setValues(String key, dynamic value, {bool print = true}) async {
// //   return await sharedPreferences.setBool(key, value.validate());
// // }
// // bool getBoolAsyncs(String key, {bool defaultValue = false}) {
// //   return sharedPreferences.getBool(key) ?? defaultValue;
// // }
// Future<bool> clearSharedPref() async {
//   return await sharedPreferences.clear();
// }
// /// add a Bool in SharedPref
// @Deprecated('Use setValue instead')
// Future<bool> setBoolAsync(String key, bool value) async {
//   return await sharedPreferences.setBool(key, value);
// }
//
// // Write DATA
//   static Future<bool> saveUserData(value) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return await sharedPreferences.setInt(valueSharedPreferences, value);
//   }
//
// // Read Data
//   static Future getUserData() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getInt(valueSharedPreferences);
//   }
//
//   // addBoolToSF(bool value) async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.setBool('boolValue', value);
//   // }
//   // getBoolValuesSF() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   //Return bool
//   //   bool? boolValue = prefs.getBool('boolValue');
//   //   return boolValue;
//   // }
// }
