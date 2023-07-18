import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colorsconstants.dart';
import '../../../constants/list_constants.dart';

class BedRoomFilter extends StatefulWidget {
  final bool isFilterPage;
  const BedRoomFilter({super.key, required this.isFilterPage});

  @override
  State<BedRoomFilter> createState() => _BedRoomFilterState();
}

class _BedRoomFilterState extends State<BedRoomFilter> {
  List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isFilterPage
          ? MediaQuery.of(context).size.height * 0.2
          : MediaQuery.of(context).size.height * 0.35,
      child: Padding(
        padding: widget.isFilterPage
            ? EdgeInsets.zero
            : EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bed,
                    color: more_page_button_color,
                  ),
                  SizedBox(width: 15.w),
                  const Text(
                    'Bedrooms',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            !widget.isFilterPage
                ? Wrap(
                    children: List.generate(
                        BEDSOPTION.length,
                        (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedIndices.contains(index)) {
                                  selectedIndices.remove(index);
                                } else {
                                  selectedIndices.add(index);
                                }
                              });
                            },
                            child: _buildOption(
                                context, BEDSOPTION[index], index))),
                  )
                : Container(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: BEDSOPTION.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedIndices.contains(index)) {
                                  selectedIndices.remove(index);
                                } else {
                                  selectedIndices.add(index);
                                }
                              });
                            },
                            child: _buildOption(
                                context, BEDSOPTION[index], index));
                      },
                    ),
                  ),
            widget.isFilterPage ? Container() : ApplyButton(),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }

  Widget ApplyButton() {
    return Container(
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
          color: more_page_button_color,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Center(
          child: Text(
        "Apply",
        style: GoogleFonts.lato(color: Colors.white, fontSize: 15.sp),
      )),
    );
  }

  Widget _buildOption(BuildContext context, String title, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.h),
      margin: EdgeInsets.symmetric(horizontal: 6.h, vertical: 8.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: selectedIndices.contains(index)
                ? greenColor
                : Colors.grey.shade400,
          ),
          color: selectedIndices.contains(index)
              ? greenshade2
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15.r)),
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 14.sp,
            color: selectedIndices.contains(index)
                ? greenColor
                : Colors.grey.shade400,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
