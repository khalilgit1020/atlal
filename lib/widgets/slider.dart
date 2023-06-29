
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/image_controller.dart';

class ImageSlider extends StatelessWidget {
  final ImageSliderController controller;

  const ImageSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: controller.images.length,
            controller: controller.pageController,
            itemBuilder: (context, index) {
              return Image.asset(
                controller.images[index],
                fit: BoxFit.fill,
              );
            },
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.images.map((image) {
                  int index = controller.images.indexOf(image);
                  return Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == index
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}