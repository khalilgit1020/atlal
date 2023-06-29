import 'package:atlal/screens/drawer_screens/drawer_screen.dart';
import 'package:atlal/screens/navigation/home_screen.dart';
import 'package:atlal/screens/navigation/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/bottom_nav_controller.dart';
import '../statics.dart';

class LandingPage extends StatelessWidget {

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: landingPageController.changeTabIndex,
      currentIndex: landingPageController.tabIndex.value,
      backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      unselectedItemColor: Colors.white.withOpacity(0.5),
      selectedItemColor: mainColor,
      unselectedLabelStyle: unselectedLabelStyle,
      selectedLabelStyle: selectedLabelStyle,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
           // size: 20.0,
          ),
          label: 'الرئيسية'.tr,
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.article,
           // size: 20.0,
          ),
          label: 'المدونة'.tr,
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),/*
        BottomNavigationBarItem(
          icon: Icon(
            Icons.production_quantity_limits,
           // size: 20.0,
          ),
          label: 'منتجاتنا'.tr,
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),*/
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
    Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
          key: landingPageController.scaffoldKey,
          drawer: DrawerScreen(),
          appBar: AppBar(
            foregroundColor: mainColor,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            elevation: 0,
          ),
          bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
          body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomeScreen(),
              PostsScreen(),
              //ProductsScreen(),
             // WebViewScreen(url: GlobalWords().productUrlAr.tr,isProduct: true,),
             // InformationScreen(),
            ],
          )),
        ));
  }
}