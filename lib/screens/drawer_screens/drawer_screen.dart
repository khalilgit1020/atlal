
import 'package:atlal/locale/locale_controller.dart';
import 'package:atlal/pdf.dart';
import 'package:atlal/screens/drawer_screens/about_us_screen.dart';
import 'package:atlal/screens/drawer_screens/products_screen.dart';
import 'package:atlal/screens/web_view_screen.dart';
import 'package:atlal/statics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../locale/static_words.dart';


class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  MyLocaleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 150,
            alignment: Alignment.center,
            color: Color.fromRGBO(36, 54, 101, 1.0),
            child: Text(
              GlobalWords().nameAr.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: DropdownButton(

              // Initial Value
              value: controller.dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              isExpanded: true,

              // Array list of items
              items: controller.items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,
                    style: GoogleFonts.cairo(),),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                controller.dropdownvalue = newValue!;
                controller.changeLand(newValue);
                print('****** ${Get.deviceLocale}');
                //  CacheHelper.putDataString(key: 'lang', value: newValue);
              },
            ),
          ),

          Theme(
            data: ThemeData.light().copyWith(
              expansionTileTheme: ExpansionTileThemeData(
                iconColor: mainColor,
                textColor: mainColor,
              ),
            ),
            child: ExpansionTile(
              title: Text(GlobalWords().know_us_Ar.tr,
                style: GoogleFonts.cairo(
                //  color: mainColor,
                ),

              ),
              // subtitle: Text('Expand this tile to see its contents'),
              // Contents
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Who_Us_Screen(
                      isMessage: true,
                    ));
                  },
                  child: Text(GlobalWords().bossMessageAr.tr,
                    style: GoogleFonts.cairo(),),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(Who_Us_Screen(
                      isMessage: false,
                    ));
                  },
                  child: Text(GlobalWords().visionMissionAr.tr,
                    style: GoogleFonts.cairo(),),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),


          ListTile(
            onTap: (){
              Get.to(() =>ProductsScreen());
            },
            leading: Icon(Icons.production_quantity_limits),
            title: Text(
              'منتجاتنا'.tr,
              style: GoogleFonts.cairo(),
            ),
          ),


          ListTile(
            onTap: (){
              Get.to(WebViewScreen(url: GlobalWords().videosUrlAr.tr,));
            },
            leading: Icon(Icons.slow_motion_video_sharp),
            title: Text(
                GlobalWords().videosAr.tr,
              style: GoogleFonts.cairo(),
            ),
          ),

          ListTile(
            onTap: (){
              Get.to(WebViewScreen(url: GlobalWords().contactUrlAr.tr,));
            },
            leading: Icon(Icons.contact_phone_outlined),
            title: Text(
              GlobalWords().contactUsAr.tr,
              style: GoogleFonts.cairo(),
            ),
          ),

          ListTile(
            onTap: (){
              Get.to(()=>OpenPDF());
              },
            leading: Icon(Icons.person),
            title: Text(
              GlobalWords().profileAr.tr,
              style: GoogleFonts.cairo(),
            ),
          ),
        ],
      ),
    );
  }
}