import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/bottomsheetdividerwidgets.dart';
import '../../../constants/colorsconstants.dart';

class AreaFilter extends StatefulWidget {
  final bool isFilterPage;
  const AreaFilter({super.key, required this.isFilterPage});

  @override
  State<AreaFilter> createState() => _AreaFilterState();
}

class _AreaFilterState extends State<AreaFilter> {
  RangeValues valuesofslider = const RangeValues(0, 35000);
  late double startValue;
  late double endValue;
  bool onChangedTrigger = false;
  bool onTapTrigger = false;
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _controller = ScrollController();
  String errorText = "";
  bool isKeyboardVisible = false;
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startValue = valuesofslider.start;
    endValue = valuesofslider.end;
    _focusNode1.addListener(() {
      setState(() {
        isKeyboardVisible = _focusNode1.hasFocus;
      });
    });

    _focusNode2.addListener(() {
      setState(() {
        isKeyboardVisible = _focusNode2.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _controller.dispose();
    super.dispose();
  }

  void updateStartValue(String value) {
    double start = double.tryParse(value) ?? 0.0;

    setState(() {
      if (start >= valuesofslider.end) {
        valuesofslider = RangeValues(valuesofslider.end, valuesofslider.end);
      }
      _focusNode1.unfocus();
    });
  }

  void updateEndValue(String value) {
    double end = double.tryParse(value) ?? 0.0;
    setState(() {
      if (end >= valuesofslider.end) {
        valuesofslider = RangeValues(valuesofslider.end, valuesofslider.end);
      }

      _focusNode2.unfocus();
    });
  }

  String validateEndValue(String value) {
    double end = double.tryParse(value) ?? 0;
    double start = double.tryParse(startController.text.toString()) ?? 0;

    if (end >= start) {
      return 'End value should be greater than start value'; // error if end value is less than or equal to start value
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels("${startValue.toStringAsFixed(0)}  Sq.ft",
        "${endValue.toStringAsFixed(0)}  Sq.ft");

    return SingleChildScrollView(
      controller: _controller,
      child: Container(
        height: widget.isFilterPage
            ? MediaQuery.of(context).viewInsets.bottom + 250
            : MediaQuery.of(context).viewInsets.bottom + 300,
        child: Column(
          children: [
            widget.isFilterPage ? Container() : horizontalDivider(8.h, 12.h),
            Container(
              padding: widget.isFilterPage
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: 15.h, right: 15.h),
              height: widget.isFilterPage
                  ? MediaQuery.of(context).viewInsets.bottom + 220
                  : MediaQuery.of(context).viewInsets.bottom + 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // text heading
                  headingOfModalSheet(
                      leftpadding: 10.h,
                      rightpadding: 10.h,
                      headingIcon: Icons.grid_3x3,
                      iconcolor: more_page_button_color,
                      headingtext1: "Area Range",
                      headingtext2: "(Square Feet)"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldDecoration(
                          borderColor:
                              onTapTrigger ? Colors.black : Colors.grey,
                          child: TextField(
                              focusNode: _focusNode1,
                              onTap: () {
                                // border color changed
                                setState(() {
                                  onTapTrigger = true;
                                });
                              },
                              onEditingComplete: () {
                                updateStartValue(startController.text);

                                setState(() {
                                  isKeyboardVisible = false;
                                });
                              },
                              controller: startController,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: '0',
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.aBeeZee(
                                    color: Colors.grey,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ))),
                      Text(
                        "to",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.grey.shade600,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFieldDecoration(
                        borderColor: onTapTrigger ? Colors.black : Colors.grey,
                        child: TextFormField(
                            focusNode: _focusNode2,
                            onTap: () {
                              // border color changed
                              setState(() {
                                onTapTrigger = true;
                              });
                            },
                            onEditingComplete: () {
                              updateEndValue(endController.text);
                            },
                            onChanged: (value) {
                              setState(() {
                                errorText = validateEndValue(value);
                                // validate the input text
                              });
                            },
                            controller: endController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              errorText: errorText,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: -4),
                              errorStyle:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                              hintText: 'Any',
                              hintStyle: GoogleFonts.aBeeZee(
                                  color: Colors.grey,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  //------------END OF ROW

                  Center(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: onChangedTrigger ? 2.0 : 1.0,
                        activeTrackColor: onChangedTrigger
                            ? Colors.green
                            : Colors.green.shade100.withOpacity(0.6),
                        inactiveTrackColor: Colors.green.shade100,
                        thumbColor: Colors.green,
                        activeTickMarkColor: Colors.transparent,
                        inactiveTickMarkColor: Colors.transparent,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      ),
                      child: RangeSlider(
                        // set the inactive tick mark color
                        values: valuesofslider,
                        min: 0,
                        max: 35000,
                        divisions: 50,
                        labels: labels,

                        onChanged: (newValues) {
                          setState(() {
                            onChangedTrigger = true;
                            valuesofslider = newValues;
                            startValue = newValues.start;
                            endValue = newValues.end;
                            startController.text =
                                newValues.start.toStringAsFixed(0);
                            endController.text =
                                newValues.end.toStringAsFixed(0);
                          });
                        },
                      ),
                    ),
                  ),
                  widget.isFilterPage
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: ApplyButton())
                ],
              ),
            ),
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
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Center(
          child: Text(
        "Apply",
        style: GoogleFonts.lato(color: Colors.white, fontSize: 15.sp),
      )),
    );
  }
}
