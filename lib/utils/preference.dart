// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static const PREF_NAME = "name";
  static const PREF_ARTIST_NAME = "artiest_name";
  static const PREF_EMAIL = "email";
  static const PREF_PASSWORD = "password";
  static const PREF_OTP = "otp";

  static removeAll() {
    add(PREF_NAME, "", SharePrefType.String);
    add(PREF_ARTIST_NAME, "", SharePrefType.String);
    add(PREF_EMAIL, "", SharePrefType.String);
    add(PREF_PASSWORD, "", SharePrefType.String);
    add(PREF_OTP, "", SharePrefType.String);
  }

  static add(String key, dynamic value, SharePrefType prefType) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    switch (prefType) {
      case SharePrefType.Bool:
        return myPref.setBool(key, value);
      case SharePrefType.Double:
        return myPref.setDouble(key, value);
      case SharePrefType.Int:
        return myPref.setInt(key, value);
      case SharePrefType.String:
        return myPref.setString(key, value);
    }
  }

  static get(String key, SharePrefType prefType) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    switch (prefType) {
      case SharePrefType.Bool:
        return myPref.getBool(key);
      case SharePrefType.Double:
        return myPref.getDouble(key);
      case SharePrefType.Int:
        return myPref.getInt(key);
      case SharePrefType.String:
        return myPref.getString(key);
    }
  }

  static Future<bool> removeKeyData(String key) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    return await myPref.remove(key);
  }

  static containsKey(key) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    return myPref.containsKey(key);
  }

  static Future<dynamic> clear() async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    return await myPref.clear();
  }
}

enum SharePrefType {
  Int,
  String,
  Bool,
  Double,
}
