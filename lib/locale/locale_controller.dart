import 'package:atlal/controller/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {

  Locale initialLang = CacheHelper.getDataString(key: 'lang') == null
      ? Get.deviceLocale!
      : Locale(CacheHelper.getDataString(key: 'lang')!);

  void changeLand(String codeLang) {
    Locale locale = Locale(codeLang);
    CacheHelper.putDataString(key: 'lang', value: codeLang);
    Get.updateLocale(locale);
  }

  String? dropdownvalue = CacheHelper.getDataString(key: 'lang') != null
      ? CacheHelper.getDataString(key: 'lang')
      : 'ar';

  // List of items in our dropdown menu
  var items = [
    'ar',
    'en',
  ];
}
