import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colorsconstants.dart';
import '../../../constants/list_constants.dart';

class PropertyTypeBottomSheet extends StatefulWidget {
  final bool isAllFilterScreen;
  const PropertyTypeBottomSheet({super.key, required this.isAllFilterScreen});

  @override
  State<PropertyTypeBottomSheet> createState() =>
      _PropertyTypeBottomSheetState();
}

class _PropertyTypeBottomSheetState extends State<PropertyTypeBottomSheet> {
  String selectedOption = 'residential';
  int _selectedIndexofitems = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: !widget.isAllFilterScreen ? EdgeInsets.all(16) : EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: !widget.isAllFilterScreen
                ? EdgeInsets.only(left: 20.0, top: 10.0)
                : EdgeInsets.zero,
            child: Row(
              children: [
                const Icon(Icons.home),
                SizedBox(width: 15.w),
                Text(
                  'Property Type',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 350.w,
            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOptionButton('Residential', 5.h, 0),
                // const SizedBox(width: 16),
                _buildOptionButton('Commercial', 0, 5.h),
              ],
            ),
          ),
          Container(
            child: selectedOption == 'residential'
                ? _buildOptionList(residentialOptions)
                : selectedOption == 'commercial'
                    ? _buildOptionList(commercialOptions)
                    : Container(),
          ),
          !widget.isAllFilterScreen
              ? GestureDetector(
                  onTap: () {
                    //code here
                  },
                  child: ApplyButton())
              : Container()
        ],
      ),
    );
  }

  Widget ApplyButton() {
    return Container(
      width: double.infinity,
      height: 40.h,
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

  Widget _buildOptionButton(
      String text, double paddingnumberleft, double paddingnumberright) {
    return Expanded(
      child: Container(
        height: 50,
        width: 150,
        margin:
            EdgeInsets.only(left: paddingnumberleft, right: paddingnumberright),
        decoration: BoxDecoration(
          color: selectedOption == text.toLowerCase()
              ? greenshade2
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                selectedOption = text.toLowerCase();
                _selectedIndexofitems = -1;
              });
            },
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: selectedOption == text.toLowerCase()
                      ? greenColor
                      : Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionList(List<PropertyFilters> options) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options
            .asMap()
            .entries
            .map((entry) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndexofitems = entry.key;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.r),
                    height: 100.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: !widget.isAllFilterScreen ? 60.h : 50.h,
                          width: !widget.isAllFilterScreen ? 70.w : 50.w,
                          decoration: BoxDecoration(
                              color: entry.key == _selectedIndexofitems
                                  ? greenshade2
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: entry.key == _selectedIndexofitems
                                      ? greenColor
                                      : Colors.grey.shade300,
                                  width: 1.0)),
                          child: Icon(
                            entry.value.iconData,
                            color: entry.key == _selectedIndexofitems
                                ? greenColor
                                : Colors.grey.shade400,
                            size: !widget.isAllFilterScreen ? 30.h : 20.h,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          entry.value.title
                              .split(' ')
                              .asMap()
                              .entries
                              .map((entry) {
                            if (entry.key % 2 != 0) return '\n${entry.value}';
                            return entry.value;
                          }).join(' '),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: entry.key == _selectedIndexofitems
                                ? greenColor
                                : Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
