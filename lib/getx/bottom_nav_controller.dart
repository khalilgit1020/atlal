import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LandingPageController extends GetxController {
  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {

    scaffoldKey.currentState!.openDrawer();

  }

  void closeDrawer() {

    scaffoldKey.currentState!.openEndDrawer();

  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}