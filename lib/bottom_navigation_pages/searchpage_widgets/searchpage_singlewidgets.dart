import 'package:bayut_clone_app/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colorsconstants.dart';

Container listViewFirstItem() {
  return Container(
      padding: EdgeInsets.only(left: 20.h, right: 20.h),
      margin: EdgeInsets.only(left: 5.h, right: 5.h),
      decoration: BoxDecoration(
          color: greenshade2,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20.r)),
      //  child: Icon(Icons.sli),
      child: Icon(
        FontAwesomeIcons.sliders,
        color: greenColor,
        size: 20.h,
      ));
}

Widget buildImage(String urlImage, int index, BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5.r),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: Image.network(
          urlImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

Container backButton(IconData iconData) {
  return Container(
    alignment: Alignment.center,
    height: 22.h,
    width: 22.w,
    decoration:
        const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    child: Icon(
      iconData,
      size: 20,
      color: Colors.grey,
    ),
  );
}

Container TruChecklabel(BuildContext context) {
  return Container(
    width: 100.w,
    height: 22.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r), color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.check),
        RichText(
          text: TextSpan(
            text: 'Tru',
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: 'Check', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: 'ᵀᴹ'),
            ],
          ),
        )
      ],
    ),
  );
}

// used in all filter screeen
Widget filterContainer(String text, DestinationField destinationField) {
  return Container(
    padding: EdgeInsets.only(left: 10.h),
    height: 45,
    width: double.infinity,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.5)),
    child: Row(
      children: [
        destinationField == DestinationField.FirstLocation ||
                destinationField == DestinationField.SecondLocation
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 5.h),
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: destinationField == DestinationField.FirstLocation
                      ? greenshade2
                      : Colors.blue.shade100.withOpacity(0.5),
                ),
                child: Text(
                  destinationField == DestinationField.FirstLocation
                      ? "A"
                      : "B",
                  style: GoogleFonts.lato(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: destinationField == DestinationField.FirstLocation
                          ? Colors.green
                          : Colors.blue),
                ),
              )
            : Container(),
        Text(
          text,
          style: GoogleFonts.lato(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    ),
  );
}
