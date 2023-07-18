import 'package:bayut_clone_app/screens/SigningScreens/SigninHeader.dart';
import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/screens/SigningScreens/emailSignUpscreen.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnBoradingScreen extends StatelessWidget {
  const OnBoradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SigninHeader(
            height: 0.40,
            topPositionLogo: 220.h,
            leftPositionLogo: 88.h,
          ),
          SizedBox(
            height: 100.h,
          ),
          Column(
            children: [
              SelectSignInMethod(
                  context: context,
                  text: "Continue with Email",
                  icondata: Icons.mail,
                  color: greenshade1,
                  onTap: () {
                    Get.to(() => const EmailSignUpScreen(),
                        transition: Transition.fadeIn);
                  }),
              SizedBox(
                height: 15.h,
              ),
              // SelectSignInMethod(
              //     context: context,
              //     color: Colors.blue.shade600,
              //     text: "Continue with Facebook",
              //     icondata: FontAwesomeIcons.facebook,
              //     onTap: () {}),
              // SizedBox(
              //   height: 15.h,
              // ),
              SelectSignInMethod(
                  context: context,
                  text: "Continue with Google",
                  icondata: FontAwesomeIcons.google,
                  color: Colors.red,
                  onTap: () async {
                    context
                        .read<FirebaseAuthHelper>()
                        .signInWithGoogle(context)
                        .then((value) {
                      Navigator.of(context).pop();
                    });
                  }),
            ],
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Need an account?",
              style: GoogleFonts.lato(
                  fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              " Sign up",
              style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: greenshade1),
            )
          ],
        ),
      ),
    );
  }

  Widget SelectSignInMethod(
      {required BuildContext context,
      required String text,
      required IconData icondata,
      required VoidCallback onTap,
      required Color color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 40.h,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(5.r)),
        child: Padding(
          padding: const EdgeInsets.only(left: 65.0),
          child: Row(
            children: [
              Icon(
                icondata,
                size: 25,
                color: color,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text,
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
