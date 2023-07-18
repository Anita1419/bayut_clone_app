import 'package:bayut_clone_app/bottom_navigation_pages/morepage_widgets/more_option_widget_list.dart';
import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/list_constants.dart';
import 'package:bayut_clone_app/constants/route_constants.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'SigninandSignUp.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  int tappedIndex = -1;
  UniqueKey? keyTile;
  bool isExpanded = false;
  bool isSelected = false;

  void expandTile() {
    setState(() {
      //  isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("method is rebuilding");

    // print(firebaseUser!.uid);
    // print(firebaseUser!.email);
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            //fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(color: more_page_haeder_color),
                child: Container(
                  height: 90.h,
                  width: 165.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/morepage_background_image.png"))),
                ),
              ),
              Positioned(
                top: 135.h,
                child: SigninOrSignUpWidget(
                  onTapClicked: () {
                    if (FirebaseAuth.instance.currentUser != null) {
                      //CREATE POST SCREEN
                    } else {
                      Navigator.pushNamed(context, onboardingScreen);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.h, right: 20.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "More on Bayut",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: morepagelistoptions.length,
                      itemBuilder: (context, index) {
                        return morepagelistoptions[index].title ==
                                morepagelistoptions[3].title
                            ? buildText(context)
                            : MoreOptionWidgetList(
                                textcolor: tappedIndex == index
                                    ? greenColor
                                    : Colors.black,
                                iconColor: tappedIndex == index
                                    ? greenColor
                                    : Colors.black26,
                                listIcon: morepagelistoptions[index].iconData,
                                onTap: () {
                                  print(morepagelistoptions[index].title);
                                  isExpanded ? shrinkTile() : expandTile();

                                  setState(() {
                                    tappedIndex = index;
                                  });
                                  if (tappedIndex == 10) {
                                    context
                                        .read<FirebaseAuthHelper>()
                                        .signOut(context);
                                    setState(() {});
                                  }
                                },
                                title: morepagelistoptions[index].title,
                              );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget buildText(BuildContext context) {
    return ExpansionTile(
      key: keyTile,
      initiallyExpanded: isExpanded,
      expandedAlignment: Alignment.topLeft,
      childrenPadding: EdgeInsets.only(left: 80.w),
      tilePadding: EdgeInsets.zero,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Row(
        children: [
          SizedBox(
            height: 20.h,
            width: 20.h,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  isExpanded ? greenColor : Colors.black26, BlendMode.dst),
              child: Image.asset(
                morepagelistoptions[3].iconData,
                color: isExpanded ? greenColor : Colors.black26,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            morepagelistoptions[3].title,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              fontSize: 15.sp,
              color: isExpanded ? greenColor : Colors.black,
            )),
          ),
        ],
      ),
      trailing: isExpanded
          ? Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 30,
              color: Colors.grey.shade600,
            )
          : Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade600,
            ),
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
          tappedIndex = -1;
        });
      },
      children: [
        Text("Area Guides",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              fontSize: 16.sp,
            ))),
        SizedBox(height: 10.h),
        Text("Building Guides",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              fontSize: 16.sp,
            ))),
        SizedBox(height: 10.h),
        Text("School Guides",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              fontSize: 16.sp,
            )))
      ],
    );
  }
}
