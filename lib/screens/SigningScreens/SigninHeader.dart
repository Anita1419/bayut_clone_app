import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/custom_signupclipper.dart';
import '../../constants/colorsconstants.dart';

class SigninHeader extends StatefulWidget {
  final double height;
  final double topPositionLogo;
  final double leftPositionLogo;
  const SigninHeader(
      {super.key,
      required this.height,
      required this.topPositionLogo,
      required this.leftPositionLogo});

  @override
  State<SigninHeader> createState() => _SigninHeaderState();
}

class _SigninHeaderState extends State<SigninHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: CustomSignupClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * widget.height,
            color: const Color(0xffE9F6EF).withOpacity(1.0),
          ),
        ),
        Positioned(
            top: 30.h,
            left: 10.w,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 25.h,
                ))),
        Positioned(
          top: widget.topPositionLogo,
          left: widget.leftPositionLogo,
          child: Column(
            children: [
              Container(
                height: 40.0,
                width: 150.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/logo_with_text_green.png"),
                )),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Welcome to Bayut.com",
                style: GoogleFonts.lato(
                    fontSize: 15.sp,
                    color: greenshade1,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}
