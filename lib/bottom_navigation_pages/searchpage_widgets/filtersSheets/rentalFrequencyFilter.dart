import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colorsconstants.dart';

class RentalFrequencyFilter extends StatefulWidget {
  final bool isFilterPage;

  const RentalFrequencyFilter({super.key, required this.isFilterPage});
  @override
  State<RentalFrequencyFilter> createState() => _RentalFrequencyFilterState();
}

class _RentalFrequencyFilterState extends State<RentalFrequencyFilter> {
  List<String> options = ['Yearly', 'Monthly', 'Weekly', 'Daily', 'Any'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Padding(
        padding: !widget.isFilterPage
            ? EdgeInsets.only(left: 20.0, right: 20.0)
            : EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: !widget.isFilterPage
                  ? EdgeInsets.only(left: 20.0, top: 10.0)
                  : EdgeInsets.zero,
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.clock),
                  SizedBox(width: 15.w),
                  const Text(
                    'Rental Frequency',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            !widget.isFilterPage
                ? Wrap(
                    children: FrequencyList(context),
                  )
                : Container(
                    height: 40.h,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: FrequencyList(context)),
                  ),
            !widget.isFilterPage
                ? GestureDetector(onTap: () {}, child: ApplyButton())
                : Container()
          ],
        ),
      ),
    );
  }

  List<Widget> FrequencyList(BuildContext context) {
    return List.generate(
        options.length,
        (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: _buildOption(context, options[index], index)));
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
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: index == selectedIndex ? greenColor : Colors.grey.shade400,
          ),
          color: index == selectedIndex ? greenshade2 : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r)),
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 14.sp,
            color: index == selectedIndex ? greenColor : Colors.grey.shade400,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
