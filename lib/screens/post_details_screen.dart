import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../statics.dart';

class PostDetailsScreen extends StatelessWidget {
  final Map details;
  const PostDetailsScreen({Key? key, required this.details}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final _htmlContent = details['content']['rendered'];


    return Scaffold(
      appBar: AppBar(
        foregroundColor: mainColor,
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 14,),
          child: Column(
            children: [

              Image.network(
                details['yoast_head_json']['og_image'][0]['url'],
                //fit: BoxFit.fill,
                //  height: 450,
                width: double.infinity,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined , color: Colors.yellow.shade700,),
                      const SizedBox(width: 5,),
                      Text('by ${details['yoast_head_json']['author']}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.update , color: Colors.yellow.shade700,),
                      const SizedBox(width: 5,),
                      Text('${details['date'].toString().split('T')[0].toString()}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attachment_sharp , color: Colors.yellow.shade700,),
                      const SizedBox(width: 5,),
                      Text('${details['yoast_head_json']['schema']['@graph'][0]['articleSection'][0]}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                details['title']['rendered'],
                style: GoogleFonts.cairo(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const Divider(
               thickness: 1,
               color: Colors.blueGrey,
             ),
              const SizedBox(
                height: 15,
              ),
              HtmlWidget(
               _htmlContent,
                textStyle: GoogleFonts.cairo(
                  fontSize: 16,
                ),

             ),
              const SizedBox(
                height: 50,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
