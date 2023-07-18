import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget horizontalDivider(double topmargin, double bottommargin) {
  return Container(
    width: 50.0,
    height: 5.0,
    margin: EdgeInsets.only(top: topmargin, bottom: bottommargin),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r), color: Colors.grey.shade400),
  );
}

//this is used in price and area filter of search page modal sheet
Widget headingOfModalSheet(
    {required double leftpadding,
    required double rightpadding,
    required IconData headingIcon,
    required Color iconcolor,
    required String headingtext1,
    required String headingtext2}) {
  return Padding(
    padding: EdgeInsets.only(left: leftpadding, top: rightpadding),
    child: Row(
      children: [
        Icon(
          headingIcon,
          color: iconcolor,
        ),
        SizedBox(width: 15.w),
        Text(
          headingtext1,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          headingtext2,
          style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
      ],
    ),
  );
}

Widget TextFieldDecoration(
    {required Widget child, required Color borderColor}) {
  return Container(
    height: 40.h,
    width: 140.w,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 15.w),
    decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(5.r)),
    child: child,
  );
}
