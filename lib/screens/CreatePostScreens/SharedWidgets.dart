import 'dart:io';

import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget HeaderOFCreatePost() {
  return Container(
    alignment: Alignment.center,
    height: 180.h,
    width: double.infinity,
    decoration: BoxDecoration(color: more_page_haeder_color),
    child: Container(
      height: 90.h,
      width: 165.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("assets/images/morepage_background_image.png"))),
    ),
  );
}

Widget HeaderOverLayCreatePostWidget(BuildContext context, String titleText) {
  return Container(
    alignment: Alignment.center,
    height: 70.h,
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      //  border: Border.all(color: Colors.black12, width: 1.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 0.0, //extend the shadow
        )
      ],
    ),
    child: Text(
      titleText,
      style: GoogleFonts.aBeeZee(fontSize: 20.sp, color: Colors.teal.shade800),
    ),
  );
}

Widget PropertyListTile(Widget widget, String text, bool showForwardArrow,
    VoidCallback onTapClicked) {
  return GestureDetector(
    onTap: onTapClicked,
    child: Container(
      height: 40.h,
      margin: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 10.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              widget,
              showForwardArrow
                  ? SizedBox(
                      width: 20.w,
                    )
                  : Container(),
              Text(
                text,
                style: GoogleFonts.aBeeZee(
                    fontSize: 17.sp, color: Colors.teal.shade800),
              ),
            ],
          ),
          showForwardArrow
              ? Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: InkWell(
                      onTap: onTapClicked,
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
                )
              : Container(),
        ],
      ),
    ),
  );
}

class PropertyTypeTextWidget extends StatelessWidget {
  final String propertySaleType;
  final String propertyType;
  const PropertyTypeTextWidget(
      {super.key, required this.propertySaleType, required this.propertyType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 10.h),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 1.0,
        color: Color.fromARGB(182, 212, 243, 205),
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Category *",
              style: ABEEZEFONTTEXT.copyWith(
                  fontSize: 15.sp,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.009) // Apply perspective effect
                  ..rotateY(-0.5), // Apply Y-axis rotation
                child: Icon(
                  FontAwesomeIcons.homeAlt,
                  size: 45,
                  color: Colors.green.shade900,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Property for ${propertySaleType}",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14.sp, color: more_page_button_color),
                  ),
                  Text(
                    propertyType,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 14.sp, color: more_page_button_color),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget BannerOfUploadMoreImage(
    {required BuildContext context, required Widget child}) {
  return Container(
    height: 30.h,
    padding: EdgeInsets.only(left: 20.h, right: 20.h),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    color: more_page_haeder_color,
    child: child,
  );
}

Widget PostImageWidget(Key key, File file, VoidCallback OnTap) {
  return Container(
    key: key,
    margin: EdgeInsets.only(left: 10.h),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Image.file(
          file,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h, right: 2.h),
          child: GestureDetector(
            onTap: OnTap,
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 20.h,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget ChildAnimatedBuilder(double animationvalue,
    {required VoidCallback onCameraClicked,
    required VoidCallback onGalleryClicked,
    required VoidCallback onExitClicked}) {
  return Container(
    height: animationvalue * 170,
    decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
    child: SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              leading: const Icon(FontAwesomeIcons.camera),
              title: const Text('Capture Image From Camera'),
              onTap: onCameraClicked),
          ListTile(
              leading: const Icon(FontAwesomeIcons.fileImport),
              title: const Text('From Gallery'),
              onTap: onGalleryClicked),
          ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Exit'),
              onTap: onExitClicked),
        ],
      ),
    ),
  );
}

Widget loadingWidget(double progress) {
  return Container(
    color: Colors.black.withOpacity(0.5),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: progress / 100,
          ),
          SizedBox(height: 16),
          Text(
            'Uploading: ${progress.toStringAsFixed(1)}%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget PostButton({required Color color, required String text}) {
  return Container(
    margin: EdgeInsets.only(left: 20.h, right: 20.h),
    width: double.infinity,
    height: 35.h,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(5.r))),
    child: Center(
        child: Text(
      text,
      style: GoogleFonts.lato(color: Colors.white, fontSize: 15.sp),
    )),
  );
}

Widget WidgetDivder() {
  return Column(
    children: [
      Divider(
        thickness: 1.h,
        color: Color.fromARGB(182, 212, 243, 205),
      ),
      SizedBox(
        height: 5.h,
      ),
    ],
  );
}

class UploadImageWidget extends StatefulWidget {
  final VoidCallback onContainerTapped;
  const UploadImageWidget({super.key, required this.onContainerTapped});

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  @override
  Widget build(BuildContext context) {
    return
        //Column(children: [
        GestureDetector(
      onTap: widget.onContainerTapped,
      child: Container(
        height: 120.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: more_page_haeder_color,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3), // controls the shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 40.h,
              color: more_page_button_color,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text("Property Images")
          ],
        ),
      ),
    );
  }
}
