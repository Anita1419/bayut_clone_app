import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/SelectPropertyTypeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/route_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninOrSignUpWidget extends StatelessWidget {
  final VoidCallback onTapClicked;
  const SigninOrSignUpWidget({
    required this.onTapClicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return GestureDetector(
      onTap: () {
        print("sign up and sign in clicked");
        if (firebaseUser != null) {
          // CREATE POST SCREEN
          Get.to(() => SelectPropertyTypeScreen(),
              transition: Transition.cupertino);
        } else {
          Navigator.pushNamed(context, onboardingScreen);
        }
      },
      child: Container(
        height: 95.h,
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
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  firebaseUser != null
                      ? "Your Journey is begin:) "
                      : "Sign in to begin your home search journey",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500))),
              SizedBox(
                height: 7.h,
              ),
              InkWell(
                onTap: onTapClicked,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 35.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: more_page_button_color),
                  child: Text(firebaseUser != null ? "SELL" : "SIGN IN/SIGN UP",
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 18.sp))),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
