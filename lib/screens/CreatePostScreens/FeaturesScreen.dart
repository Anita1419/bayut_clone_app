import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bayut_clone_app/constants/colorsconstants.dart';

class FeatureScreen extends StatefulWidget {
  final List<String> listfeatures;
  const FeatureScreen({
    Key? key,
    required this.listfeatures,
  }) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  List<String> returnedSelectedlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Features",
            style:
                ABEEZEFONTTEXT.copyWith(fontSize: 18.sp, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(left: 10.h),
          itemCount: widget.listfeatures.length,
          itemBuilder: (context, index) {
            String feature = widget.listfeatures[index];
            bool isSelected = returnedSelectedlist.contains(feature);

            return Column(
              children: [
                ListTile(
                  title: Text(
                    widget.listfeatures[index],
                    style: ABEEZEFONTTEXT.copyWith(
                        color:
                            isSelected ? more_page_button_color : Colors.grey),
                  ),
                  trailing: isSelected
                      ? Icon(
                          Icons.check,
                          color: more_page_button_color,
                        )
                      : null,
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        returnedSelectedlist.remove(feature);
                      } else {
                        returnedSelectedlist.add(feature);
                      }
                    });
                  },
                ),
                // Divider(
                //   color: Colors.green,
                // )
              ],
            );
          },
        ),
        bottomNavigationBar: GestureDetector(
            onTap: () {
              Navigator.pop(context, returnedSelectedlist);
            },
            child: ApplyButton()));
  }

  Widget ApplyButton() {
    return Container(
      margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
          color: more_page_button_color,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Center(
          child: Text(
        "Confirm",
        style: GoogleFonts.lato(color: Colors.white, fontSize: 15.sp),
      )),
    );
  }
}
