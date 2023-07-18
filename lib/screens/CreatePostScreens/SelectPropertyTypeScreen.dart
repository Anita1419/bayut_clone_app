import 'package:bayut_clone_app/screens/CreatePostScreens/PropertyOptionsScreen.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/SharedWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SelectPropertyTypeScreen extends StatefulWidget {
  const SelectPropertyTypeScreen({super.key});

  @override
  State<SelectPropertyTypeScreen> createState() =>
      _SelectPropertyTypeScreenState();
}

class _SelectPropertyTypeScreenState extends State<SelectPropertyTypeScreen> {
  String propertyType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              HeaderOFCreatePost(),
              Positioned(
                  top: 140.h,
                  left: 20.h,
                  child: HeaderOverLayCreatePostWidget(
                      context, "What You are Offering?"))
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          PropertyListTile(
              Icon(FontAwesomeIcons.houseChimney), "Property for sale", true,
              () {
            propertyType = "Sale";
            print(propertyType);
            Get.to(
                () => PropertyOptionsScreen(
                      getPropertyType: propertyType,
                    ),
                opaque: false,
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 500));
          }),
          PropertyListTile(
              Icon(FontAwesomeIcons.key), "Property for Rent", true, () {
            propertyType = "Rent";
            print(propertyType);
            Get.to(
                () => PropertyOptionsScreen(
                      getPropertyType: propertyType,
                    ),
                opaque: false,
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 500));
          }),
        ],
      ),
    );
  }
}
