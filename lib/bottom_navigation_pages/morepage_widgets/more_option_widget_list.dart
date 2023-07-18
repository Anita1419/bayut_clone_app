import 'package:bayut_clone_app/constants/list_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MoreOptionWidgetList extends StatefulWidget {
  final String listIcon;
  final String title;
  VoidCallback onTap;
  Color textcolor;
  Color iconColor;
  VoidCallback? isExpandedClose;

  MoreOptionWidgetList(
      {Key? key,
      required this.listIcon,
      required this.title,
      required this.onTap,
      required this.textcolor,
      required this.iconColor,
      this.isExpandedClose})
      : super(key: key);

  @override
  State<MoreOptionWidgetList> createState() => _MoreOptionWidgetListState();
}

class _MoreOptionWidgetListState extends State<MoreOptionWidgetList> {
  bool isSelected = false;
  UniqueKey? keyTile;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.black12),
      )),
      child: Center(
        child: ListTile(
          minVerticalPadding: 20.h,
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              // this synatax if like if (contain 0r  then inside of that if than else case)
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: widget.title == morepagelistoptions[6].title ||
                        widget.title == morepagelistoptions[7].title ||
                        widget.title == morepagelistoptions[2].title ||
                        widget.title == "Log Out"
                    ? widget.title == morepagelistoptions[6].title
                        ? Icon(
                            Icons.settings,
                            color: widget.iconColor,
                          )
                        : widget.title == morepagelistoptions[7].title
                            ? Icon(
                                Icons.contact_mail,
                                color: widget.iconColor,
                              )
                            : widget.title == "Log Out"
                                ? Icon(
                                    Icons.logout,
                                    color: widget.iconColor,
                                  )
                                : Icon(
                                    Icons.newspaper_rounded,
                                    color: widget.iconColor,
                                  )
                    : Image.asset(
                        widget.listIcon,
                        color: widget.iconColor,
                      ),
              ),

              // : Icon(
              //     widget.listIcon as IconData,
              //     size: 23.h,
              //     color: widget.iconColor,
              //   ),
              SizedBox(width: 12.w),
              Text(
                widget.title,
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 15.sp, color: widget.textcolor)),
              ),
            ],
          ),
          trailing: Padding(
              padding: EdgeInsets.only(top: 9.h),
              child: const Icon(Icons.arrow_forward_ios)),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
