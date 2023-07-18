import 'package:bayut_clone_app/screens/SigningScreens/SigninHeader.dart';
import 'package:bayut_clone_app/screens/SigningScreens/signup_screen.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colorsconstants.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  bool obsecureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  loginUser() {
    context.read<FirebaseAuthHelper>().logInWithEmail(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SigninHeader(
              height: 0.30,
              topPositionLogo: 160.h,
              leftPositionLogo: 88.h,
            ),
            SizedBox(
              height: 45.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Email Address",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15.sp, fontWeight: FontWeight.w300),
                )),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0, left: 15.h, right: 15.h),
              height: 35.h,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Text(
                  "Password",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15.sp, fontWeight: FontWeight.w300),
                )),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0, left: 15.h, right: 15.h),
              height: 35.h,
              child: TextField(
                controller: passwordController,
                obscureText: obsecureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: IconButton(
                    icon: obsecureText
                        ? Icon(
                            FontAwesomeIcons.eye,
                            color: Colors.grey,
                            size: 15.h,
                          )
                        : Icon(
                            FontAwesomeIcons.eyeSlash,
                            color: Colors.grey,
                            size: 15.h,
                          ),
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 10.h),
                child: Text(
                  "Forgot Password ?",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: more_page_button_color),
                )),
            SizedBox(
              height: 25.h,
            ),
            GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  loginUser();
                },
                child: ApplyButton()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have account? ",
              style: GoogleFonts.aBeeZee(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: more_page_button_color),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SignUpScreen(),
                    transition: Transition.cupertino);
              },
              child: Text(
                "SignUp",
                style: GoogleFonts.aBeeZee(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: greenColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ApplyButton() {
    return Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h),
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
          color: more_page_button_color,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Center(
          child: Text(
        "Login",
        style: GoogleFonts.lato(color: Colors.white, fontSize: 15.sp),
      )),
    );
  }
}
