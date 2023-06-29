import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/image_controller.dart';
import '../locale/static_words.dart';

class Branches extends StatelessWidget {
  final ImageSliderController controller;
  const Branches({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          GlobalWords().partnerAr.tr,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          height: 800,
          width: MediaQuery.of(context).size.width / 1.7,
          child: ListView.builder(
            itemCount: controller.partners.length,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Image.asset(controller.partners[index]),
                  const SizedBox(height: 10,)
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
