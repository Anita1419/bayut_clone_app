import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final firebaseuser = context.read<FirebaseAuthHelper>().user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                transform: Matrix4.skewX(-0.2),
                margin: EdgeInsets.only(left: 20.0),
                width: MediaQuery.of(context).size.width / 2,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                        color: Colors.green,
                      ),
                      bottom: BorderSide(color: Colors.green),
                      left: BorderSide(color: Colors.green),
                      right: BorderSide(width: 1.0, color: Colors.green)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(10.0),
                      topLeft: const Radius.circular(10.0),
                      bottomRight: Radius.zero,
                      topRight: Radius.zero),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(color: Colors.green),
                        bottom: BorderSide(color: Colors.green),
                        left: BorderSide(color: Colors.green),
                        right: BorderSide(color: Colors.green)),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150.h,
                bottom: 1.h,
                child: Container(
                  height: 47.0,
                  width: 50.h,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TopBorderRadiusClipper extends CustomClipper<Path> {
  final double borderRadius;

  TopBorderRadiusClipper({this.borderRadius = 10.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(0, borderRadius); // Move to the top-left corner
    path.quadraticBezierTo(0, 0, borderRadius, 0); // Add top-left border radius
    path.lineTo(size.width - borderRadius, 0); // Move to the top-right corner
    path.quadraticBezierTo(
        size.width, 0, size.width, borderRadius); // Add top-right border radius
    path.lineTo(size.width, size.height); // Move to the bottom-right corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(TopBorderRadiusClipper oldClipper) => false;
}
