import 'package:atlal/getx/image_controller.dart';
import 'package:atlal/widgets/branches.dart';
import 'package:atlal/widgets/carousal_slider.dart';
import 'package:atlal/widgets/slider.dart';
import 'package:atlal/widgets/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../locale/static_words.dart';
import '../../statics.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  ImageSliderController controller = Get.put(ImageSliderController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ImageSlider(
              controller: controller,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/logo.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'أهلاً وسهلاً بكم في محمصة الأطلال'.tr,
                            style: GoogleFonts.cairo(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            GlobalWords().introAr.tr,
                            style: GoogleFonts.cairo(
                                fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Column(
                      children: [
                        buildColumnItem(
                          number: '+39',
                          desc: GlobalWords().Working_Year_Ar,
                        ),
                        buildColumnItem(
                          number: '+3',
                          desc: GlobalWords().BranchesAr,
                        ),
                        buildColumnItem(
                          number: '+99',
                          desc: GlobalWords().productsAr,
                        ),
                        buildColumnItem(
                          number: '15%',
                          desc: GlobalWords().DiscountAr,
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            // branches
            Branches(controller: controller),
            Divider(),
            CustomCarousal(controller: controller),
            SizedBox(
              height: 20,
            ),
            Divider(),
            VideoPlayerScreen(videoId: 'Mn2NSjm7reA'),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Column buildColumnItem({String? number, String? desc, bool isLast = false}) {
    return Column(
      children: [
        Text(
          '*',
          style: TextStyle(
            color: mainColor,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          number!,
          style: GoogleFonts.cairo(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
        Text(
          desc!.tr,
          style: GoogleFonts.cairo(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        isLast ? Container() : Divider(),
      ],
    );
  }
}
