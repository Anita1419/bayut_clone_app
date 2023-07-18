import 'package:bayut_clone_app/provider/searchpage_provider/Rentandbuyfilterprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colorsconstants.dart';

class RentBottomModalSheet extends StatefulWidget {
  const RentBottomModalSheet({super.key});

  @override
  State<RentBottomModalSheet> createState() => _RentBottomModalSheetState();
}

class _RentBottomModalSheetState extends State<RentBottomModalSheet> {
  @override
  Widget build(BuildContext context) {
    final rentListItemSelected = Get.find<RentAndBuyProvider>();
    return Container(
      alignment: Alignment.center,
      height: 100.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: Colors.white,
      ),
      child: Container(
        height: 60.0,
        width: 350.w,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
            children: List<Widget>.generate(rentListItemSelected.items.length,
                (int index) {
          return Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                for (int i = 0; i < rentListItemSelected.items.length; i++) {
                  rentListItemSelected.items[i] = i == index;
                }
                rentListItemSelected.updateItem(
                    index, rentListItemSelected.items[index]);
                print(rentListItemSelected.items);
                // Navigator.pop(context);
              });
              //  widget.RentFilterSelected();
            },
            child: Container(
              alignment: Alignment.center,
              color: rentListItemSelected.items[index]
                  ? greenshade4
                  : Colors.transparent,
              child: Text(
                index == 0 ? "Rent" : "Buy",
                style: GoogleFonts.lato(
                    color: rentListItemSelected.items[index]
                        ? greenColor
                        : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              ),
            ),
          ));
        })),
      ),
    );
  }
}




// Expanded(
//               child: GestureDetector(
//             onTap: () {},
//             child: Container(
//               alignment: Alignment.center,
//               color: greenshade4,
//               child: Text(
//                 "Rent",
//                 style: GoogleFonts.lato(
//                     color: greenColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 13.sp),
//               ),
//             ),
//           )),