import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSliderController extends GetxController {
  final pageController = PageController();


  List<String> partners = [
    'assets/partners/p1.webp',
    'assets/partners/p2.jpg',
    'assets/partners/p3.webp',
  ];


  List<Widget>? home_products = [
    Image.asset('assets/home_product/p1.webp'),
    Image.asset('assets/home_product/p2.webp'),
    Image.asset('assets/home_product/p3.webp'),
    Image.asset('assets/home_product/p4.webp'),
    Image.asset('assets/home_product/p5.webp'),
    Image.asset('assets/home_product/p6.webp'),
  ];



  final images = [
    'assets/slider/s1.png',
    'assets/slider/s2.png',
    'assets/slider/s3.png',
  ];

  RxInt currentIndex = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Start the auto-slide timer
    _startTimer();
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed
    _cancelTimer();
    super.onClose();
  }

  void _startTimer() {
    // Start a timer that moves to the next image every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setCurrentIndex((currentIndex.value + 1) % images.length);
    });
  }

/*
  void _startTimer() {
    // Start a timer that moves to the next image every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(currentIndex.value == 0){
        setCurrentIndex(0);
        print(" +++ ${currentIndex.value}");
        currentIndex.value = currentIndex.value + 1;
      }else if(currentIndex.value == 1) {
        setCurrentIndex((1));
        print(' --- ${currentIndex.value}');
        currentIndex.value = currentIndex.value + 1;
      }else{
        setCurrentIndex((2));
        print(currentIndex.value);
        currentIndex.value = 0;
      }
    });
  }
*/

  void _cancelTimer() {
    // Cancel the auto-slide timer
    // This is important to prevent memory leaks
    _timer!.cancel();
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
    if (index == images.length - 1) {
      // If last photo, wait for 3 seconds and go back to the first photo
      Future.delayed(Duration(seconds: 3), () {
        setCurrentIndex(0);
      });
    }

    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 700),
      curve: Curves.linear,
    );


  }
}
