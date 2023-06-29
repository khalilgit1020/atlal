import 'package:atlal/locale/static_words.dart';
import 'package:atlal/screens/post_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/static_api.dart';
import '../../statics.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var wpPost = snapshot.data![index];

                if (wpPost['yoast_head_json']['schema']['@graph'][0]
                            ['articleSection'] !=
                        null &&
                    wpPost['yoast_head_json']['schema']['@graph'][0]
                            ['articleSection'][0] ==
                        GlobalWords().NewsAr.tr) {
                  return InkWell(
                    onTap: (){
                      Get.to(PostDetailsScreen(details: wpPost));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 450,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.network(
                                wpPost['yoast_head_json']['og_image'][0]['url'],
                                //fit: BoxFit.fill,
                                //  height: 450,
                                width: double.infinity,
                              ),
                              Container(
                                color: Colors.black45,
                                height: 450,
                                width: double.infinity,
                              ),
                              SizedBox(height: 20,),

                              // title
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    wpPost['title']['rendered'],
                                    style: GoogleFonts.cairo(

                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                // const Divider(
                                //   thickness: 2,
                                //   color: Colors.blueGrey,
                                // ),
                                // HtmlWidget(
                                //   _htmlContent,
                                // ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // const SizedBox(
                                //     height: 50,
                                // ),

                              ),


                              // type
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    GlobalWords().NewsTitleAr.tr,
                                    style: GoogleFonts.cairo(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              // date
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(
                                    right: 12,
                                    left: 12,
                                  ),
                                  color: mainColor,
                                  child: Text(
                                    wpPost['date'].toString().split('T')[0].toString(),
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                // const Divider(
                                //   thickness: 2,
                                //   color: Colors.blueGrey,
                                // ),
                                // HtmlWidget(
                                //   _htmlContent,
                                // ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // const SizedBox(
                                //     height: 50,
                                // ),

                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
