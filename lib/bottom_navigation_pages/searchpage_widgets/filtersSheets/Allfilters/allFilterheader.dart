import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AllFilterHeader extends StatelessWidget {
  const AllFilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.h, top: 10.h),
      height: 100.h,
      decoration: BoxDecoration(
          color: lightshadeofdarkgreen.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Find properties by ',
                    style: TextStyle(fontSize: 14.sp, color: darkgreenshade),
                    children: [
                      TextSpan(
                        text: 'commute time from preffered locations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: darkgreenshade),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 120.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Center(
                      child: Text(
                    "Start search",
                    style: GoogleFonts.merriweatherSans(
                        fontSize: 14.sp,
                        textStyle: TextStyle(color: darkgreenblueshade)),
                  )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.carRear,
                  size: 50.h,
                  color: const Color(0xff1b5771),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
