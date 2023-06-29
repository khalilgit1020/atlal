import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../locale/static_words.dart';
import '../../statics.dart';

class Who_Us_Screen extends StatelessWidget {
  final bool isMessage;

  Who_Us_Screen({Key? key, required this.isMessage}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isMessage
              ? GlobalWords().bossMessageAr.tr
              : GlobalWords().visionMissionAr.tr,
          style: GoogleFonts.cairo(),
        ),
        centerTitle: true,
        foregroundColor: mainColor,
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: isMessage
              ? BossMessage()
              : VisionMission(),
        ),
      ),
    );
  }

}

class BossMessage extends StatelessWidget {
  const BossMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 12,
          ),
          child: Center(
            child: Text(
              GlobalWords().bossMessageSubAr.tr,
              style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold, fontSize: 26,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/boss.jpg'),
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          GlobalWords().bossMessageTitleAr.tr,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
        const Divider(),
        const SizedBox(
          height: 15,
        ),
        Text(
          GlobalWords().bossMessageContentAr.tr,
          style: GoogleFonts.cairo(),
        ),
      ],
    );
  }
}

class VisionMission extends StatelessWidget {
   VisionMission({
    super.key,
  });

  List<String> valueList = [
    GlobalWords().valueContentAr1.tr,
    GlobalWords().valueContentAr2.tr,
    GlobalWords().valueContentAr3.tr,
    GlobalWords().valueContentAr4.tr,
    GlobalWords().valueContentAr5.tr,
    GlobalWords().valueContentAr6.tr,
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContent(
          title: GlobalWords().visionAr,
          content: GlobalWords().visionContentAr,
        ),
        const Divider(
          thickness: 2,
        ),
        buildContent(
          title: GlobalWords().missionAr,
          content: GlobalWords().missionContentAr,
        ),
        const Divider(
          thickness: 2,
        ),
        Text(
          GlobalWords().valueAr.tr,
          style: GoogleFonts.cairo(

            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15,),
        Container(
          height: 500,
          child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: valueList.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    valueList[index],
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
        ),
      ],
    );
  }
}


Padding buildContent({String? title, String? content}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Center(
      child: Column(
        children: [
          Text(
            title!.tr,
            style: GoogleFonts.cairo(

              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content!.tr,
            style: GoogleFonts.cairo(
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ),
  );
}