import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static SharedPreferences? sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();

  }

  static Future<bool> putData({required String key,required bool value})async{

    return await sharedPreferences!.setBool(key, value);

  }

  static bool? getData({required String key}){

    return  sharedPreferences!.getBool(key);

  }

  static Future<bool> putDataInt({required String key,required int value})async{

    return await sharedPreferences!.setInt(key, value);

  }

  static int? getDataInt({required String key}){

    return  sharedPreferences!.getInt(key);

  }


  static Future<bool> putDataDouble({required String key,required double value})async{

    return await sharedPreferences!.setDouble(key, value);

  }

  static double? getDataDouble({required String key}){

    return  sharedPreferences!.getDouble(key);

  }

  static Future<bool> putDataString({required String key,required String value})async{

    return await sharedPreferences!.setString(key, value);

  }

  static String? getDataString({required String key}){

    return  sharedPreferences!.getString(key);

  }


}