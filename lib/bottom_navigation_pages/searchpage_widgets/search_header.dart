import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colorsconstants.dart';

class Search_header extends StatelessWidget {
  final VoidCallback locationOnClicked;
  final VoidCallback saveOnClicked;
  const Search_header({
    super.key,
    required this.locationOnClicked,
    required this.saveOnClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: locationOnClicked,
          child: Container(
            width: 250.w,
            height: 40.h,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
                borderRadius: BorderRadius.circular(7.h)),
            child: Row(
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.grey.shade400,
                  size: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Select location",
                  style: GoogleFonts.openSans(
                      fontSize: 16.sp, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: saveOnClicked,
            icon: Icon(
              Icons.bookmark_border_rounded,
              size: 35,
              color: greenshade1,
            )),
        Text(
          "Save",
          style: GoogleFonts.lato(
              fontSize: 16.sp, fontWeight: FontWeight.w700, color: greenshade1),
        )
      ],
    );
  }
}
