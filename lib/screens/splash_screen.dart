import 'dart:async';

import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      _toggleAnimation();
      _navigatetohome();
    });
  }

  _toggleAnimation() {
    setState(() {
      isFirst = false;
    });
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Center(
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 1000),
          secondChild: SizedBox(
            width: 200.w,
            child: Image.asset("assets/images/logo_with_text_white.png"),
          ),
          firstChild: Container(
            height: 50.h,
            width: 50.h,
            // color: Colors.grey,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/logo_with_green_background.png"))),
          ),
          crossFadeState:
              isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
