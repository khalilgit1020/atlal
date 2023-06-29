import 'package:atlal/locale/locale.dart';
import 'package:atlal/locale/locale_controller.dart';
import 'package:atlal/screens/navigation/home_screen.dart';
import 'package:atlal/screens/landing_screen.dart';
import 'package:atlal/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/cache_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: controller.initialLang,
     translations: MyLocale(),
     getPages: [
       GetPage(name: '/', page: ()=> SplashScreen()),
     ],
     // home: LandingPage(),
    );
  }
}

