import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../locale/static_words.dart';
import '../../statics.dart';
import '../web_view_screen.dart';

class ProductsScreen extends StatelessWidget {
   ProductsScreen({Key? key}) : super(key: key);


  List products_logo = [
    ['assets/products/1.webp',GlobalWords().firstProductAr,GlobalWords().firstProductArUrl],
    ['assets/products/2.webp',GlobalWords().secondProductAr,GlobalWords().secondProductArUrl],
    ['assets/products/3.webp',GlobalWords().thirdProductAr,GlobalWords().thirdProductArUrl],
    ['assets/products/4.webp',GlobalWords().fourthProductAr,GlobalWords().fourthProductArUrl],
    ['assets/products/5.webp',GlobalWords().fifthProductAr,GlobalWords().fifthProductArUrl],
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'منتجاتنا'.tr,
        ),
        foregroundColor: mainColor,
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        elevation: 0,
      ),
      body: Container(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: products_logo.length,
          separatorBuilder: (context, index) => Divider(
            thickness: 1.5,
          ),
          itemBuilder: (context, index) {
            List index_pro = products_logo[index];

            return InkWell(
              onTap: () {
                Get.to(WebViewScreen(
                  url: '${index_pro[2]}'.tr,
                ));
              },
              child: Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(index_pro[0]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${index_pro[1]}'.tr,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
