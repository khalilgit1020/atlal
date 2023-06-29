import 'package:atlal/getx/image_controller.dart';
import 'package:atlal/locale/static_words.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCarousal extends StatelessWidget {
  final ImageSliderController controller;
  const CustomCarousal({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          GlobalWords().carousalHomeAr.tr,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20,),
        CarouselSlider(
          items: controller.home_products,
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              // Handle page change event
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
