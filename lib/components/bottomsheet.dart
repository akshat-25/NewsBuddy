// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newzz/utils/test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'components.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
            title: title,
            description: description,
            imageurl: imageurl,
            url: url);
      });
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const MyBottomSheetLayout({
    Key? key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child:
                Modifiedtext(text: description, size: 16, color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Read Full Article',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _makeSocialMediaRequest(url);
                    },
                  style: GoogleFonts.lato(
                    color: Colors.blue.shade400,
                  ))
            ])),
          )
        ],
      ),
    );
  }
}

// _launchURL(url) async {
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

Future<void> _makeSocialMediaRequest(String url) async {
  if (await launchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
