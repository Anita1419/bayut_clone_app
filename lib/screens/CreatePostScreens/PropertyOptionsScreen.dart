import "package:bayut_clone_app/constants/temporary_constants.dart";
import "package:bayut_clone_app/screens/CreatePostScreens/SharedWidgets.dart";
import 'package:bayut_clone_app/screens/CreatePostScreens/PostEntryScreen.dart';
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";

class PropertyOptionsScreen extends StatefulWidget {
  final String getPropertyType;
  const PropertyOptionsScreen({super.key, required this.getPropertyType});

  @override
  State<PropertyOptionsScreen> createState() => _PropertyOptionsScreenState();
}

class _PropertyOptionsScreenState extends State<PropertyOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              HeaderOFCreatePost(),
              Positioned(
                  top: 140.h,
                  left: 20.h,
                  child: HeaderOverLayCreatePostWidget(
                      context,
                      widget.getPropertyType == "Sale"
                          ? "Property For Sale"
                          : "Property For Rent")),
              Positioned(
                top: 35.h,
                left: 10.h,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.green,
                    size: 30.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          widget.getPropertyType == "Sale" ? SaleProperty() : RentProperty()
        ],
      ),
    ));
  }

  Widget SaleProperty() {
    return Column(
      children: [
        PropertyListTile(Container(), LANDANDPLOTS, false, () {
          Get.to(
              () => PostEntryScreen(
                  category: LANDANDPLOTS,
                  propertSaleType: widget.getPropertyType),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), HOUSES, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: HOUSES,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), APARTMENTSANDFLATS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: APARTMENTSANDFLATS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), SHOP_OFFICES_COMMERCIAL_SPACE, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: SHOP_OFFICES_COMMERCIAL_SPACE,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), PORTIONSANDFLOORS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: PORTIONSANDFLOORS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
      ],
    );
  }

  Widget RentProperty() {
    return Column(
      children: [
        PropertyListTile(Container(), HOUSES, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: HOUSES,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), PORTIONSANDFLOORS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: PORTIONSANDFLOORS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), APARTMENTSANDFLATS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: APARTMENTSANDFLATS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), SHOP_OFFICES_COMMERCIAL_SPACE, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: SHOP_OFFICES_COMMERCIAL_SPACE,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), ROOMS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: ROOMS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), "Roommates & Paying Guests", false, () {
          Get.to(
              () => PostEntryScreen(
                    category: PAYINGGUEST,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), VACATION_RENTALS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: VACATION_RENTALS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
        PropertyListTile(Container(), LANDANDPLOTS, false, () {
          Get.to(
              () => PostEntryScreen(
                    category: LANDANDPLOTS,
                    propertSaleType: widget.getPropertyType,
                  ),
              opaque: false,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        }),
      ],
    );
  }
}
