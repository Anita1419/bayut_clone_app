import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colorsconstants.dart';

// ignore: camel_case_types, must_be_immutable
class listViewFilter extends StatefulWidget {
  final String text;
  final int index;
  final bool isSelected;
  VoidCallback? truCheckFirstClicked;
  listViewFilter({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
    truCheckFirstClicked,
  });

  @override
  State<listViewFilter> createState() => _listViewFilterState();
}

class _listViewFilterState extends State<listViewFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20.h,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 5.h, right: 5.h),
        margin: EdgeInsets.only(left: 5.h, right: 5.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20.r),
          color: widget.isSelected ? greenshade4 : Colors.transparent,
        ),
        //  child: Icon(Icons.sli),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5.h,
            ),
            widget.index == 10
                ? Icon(
                    FontAwesomeIcons.sliders,
                    color:
                        widget.isSelected ? greenColor : Colors.grey.shade700,
                    size: 15.h,
                  )
                : Container(),
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 16.0,
                  color: widget.isSelected ? greenColor : Colors.grey.shade700),
            ),
            SizedBox(
              width: 10.w,
            ),
            widget.index != 1 && widget.index != 10
                ? Icon(
                    Icons.keyboard_arrow_down,
                    color:
                        widget.isSelected ? greenColor : Colors.grey.shade700,
                  )
                : Container(),
            widget.isSelected && widget.index == 1
                ? GestureDetector(
                    onTap: widget.truCheckFirstClicked,
                    child: const Icon(
                      Icons.close,
                      color: Colors.green,
                    ),
                  )
                : Container()
          ],
        ));
  }
}
