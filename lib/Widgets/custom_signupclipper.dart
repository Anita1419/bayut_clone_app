import 'package:flutter/material.dart';

class CustomSignupClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9984275, size.height);
    path_0.cubicTo(
        size.width * 0.9744314,
        size.height * 0.9960171,
        size.width * 0.9504501,
        size.height * 0.9917872,
        size.width * 0.9264295,
        size.height * 0.9881246);
    path_0.cubicTo(
        size.width * 0.9080595,
        size.height * 0.9853188,
        size.width * 0.8896136,
        size.height * 0.9837017,
        size.width * 0.8712583,
        size.height * 0.9807107);
    path_0.cubicTo(
        size.width * 0.8435221,
        size.height * 0.9761913,
        size.width * 0.8157076,
        size.height * 0.9736672,
        size.width * 0.7878954,
        size.height * 0.9709001);
    path_0.cubicTo(
        size.width * 0.7744682,
        size.height * 0.9695570,
        size.width * 0.7737064,
        size.height * 0.9671448,
        size.width * 0.7737064,
        size.height * 0.9451076);
    path_0.cubicTo(
        size.width * 0.7737015,
        size.height * 0.8668465,
        size.width * 0.7737162,
        size.height * 0.7885777,
        size.width * 0.7736967,
        size.height * 0.7103204);
    path_0.cubicTo(
        size.width * 0.7736918,
        size.height * 0.6838989,
        size.width * 0.7655869,
        size.height * 0.6709197,
        size.width * 0.7490637,
        size.height * 0.6709197);
    path_0.cubicTo(
        size.width * 0.5831658,
        size.height * 0.6708966,
        size.width * 0.4172678,
        size.height * 0.6709004,
        size.width * 0.2513673,
        size.height * 0.6709120);
    path_0.cubicTo(
        size.width * 0.2344694,
        size.height * 0.6709197,
        size.width * 0.2263058,
        size.height * 0.6839723,
        size.width * 0.2262838,
        size.height * 0.7114320);
    path_0.cubicTo(
        size.width * 0.2262201,
        size.height * 0.7912909,
        size.width * 0.2261760,
        size.height * 0.8711536,
        size.width * 0.2263425,
        size.height * 0.9510087);
    path_0.cubicTo(
        size.width * 0.2263670,
        size.height * 0.9619192,
        size.width * 0.2256543,
        size.height * 0.9668978,
        size.width * 0.2169322,
        size.height * 0.9687658);
    path_0.cubicTo(
        size.width * 0.1849244,
        size.height * 0.9755970,
        size.width * 0.1526520,
        size.height * 0.9758826,
        size.width * 0.1206001,
        size.height * 0.9809075);
    path_0.cubicTo(
        size.width * 0.08924622,
        size.height * 0.9858244,
        size.width * 0.05793154,
        size.height * 0.9914398,
        size.width * 0.02657523,
        size.height * 0.9963181);
    path_0.cubicTo(
        size.width * 0.01823526,
        size.height * 0.9976149,
        size.width * 0.009726287,
        size.height * 0.9961252,
        size.width * 0.001528382,
        size.height * 0.9999961);
    path_0.cubicTo(
        size.width * -0.0008915559,
        size.height * 0.9952877,
        size.width * 0.0002792236,
        size.height * 0.9897378,
        size.width * 0.0002792236,
        size.height * 0.9846203);
    path_0.cubicTo(
        size.width * 0.0002204397,
        size.height * 0.6616263,
        size.width * 0.0002204397,
        size.height * 0.3386400,
        size.width * 0.0002694262,
        size.height * 0.01564991);
    path_0.cubicTo(
        size.width * 0.0002694262,
        size.height * 0.01043584,
        size.width * -0.0005829404,
        size.height * 0.004990216,
        size.width * 0.001212418,
        0);
    path_0.cubicTo(size.width * 0.3337260, 0, size.width * 0.6662421, 0,
        size.width * 0.9987582, 0);
    path_0.cubicTo(
        size.width * 1.000620,
        size.height * 0.005534393,
        size.width * 0.9996963,
        size.height * 0.01150104,
        size.width * 0.9996963,
        size.height * 0.01724384);
    path_0.cubicTo(
        size.width * 0.9997477,
        size.height * 0.3391688,
        size.width * 0.9997526,
        size.height * 0.6610975,
        size.width * 0.9996767,
        size.height * 0.9830263);
    path_0.cubicTo(
        size.width * 0.9996767,
        size.height * 0.9886726,
        size.width * 1.000958,
        size.height * 0.9947473,
        size.width * 0.9984275,
        size.height);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
