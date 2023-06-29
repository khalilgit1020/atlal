import 'package:atlal/locale/static_words.dart';
import 'package:atlal/statics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class OpenPDF extends StatelessWidget {
  const OpenPDF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        foregroundColor: mainColor,
      ),
      body: SfPdfViewer.network(
        GlobalWords().profileArUrl.tr,
      )
    //  PdfViewer.openAsset(GlobalWords().profileArUrl.tr),
    );
  }
}
