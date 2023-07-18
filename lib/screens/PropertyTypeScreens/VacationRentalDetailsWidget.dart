import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/number_to_word_conversion.dart';
import 'package:bayut_clone_app/provider/ListController.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/SharedWidgets.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/LandAndPostDetails.dart';
import 'package:bayut_clone_app/screens/SigningScreens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VacationRentalDetailsWidget extends StatefulWidget {
  const VacationRentalDetailsWidget({super.key});

  @override
  State<VacationRentalDetailsWidget> createState() =>
      _VacationRentalDetailsWidgetState();
}

class _VacationRentalDetailsWidgetState
    extends State<VacationRentalDetailsWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String word = "";
  //VALIDATION VARAIABLE
  bool isValidate = false;

  //CONTROLLER VARAIABLE
  final ListItemController lIController = Get.find();

  //ERROR MESSAGE VARIABLES
  ValueNotifier<String> errorMessagePrice = ValueNotifier<String>('');
  ValueNotifier<String> errorMessageAddress = ValueNotifier<String>('');
  ValueNotifier<String> errorMessagearea = ValueNotifier<String>('');
  ValueNotifier<String> errorMessagetitle = ValueNotifier<String>('');
  ValueNotifier<String> errorMessageDescription = ValueNotifier<String>('');
  bool isBedRoomStateSelected = false;
  bool isBathsRoomStateSelected = false;
  Color bedRoomTitleColor = Colors.grey.shade700;
  Color bathRoomTitleColor = Colors.grey.shade700;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //**********************PRICE***********************************//

          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: textTitle("Price *")),
          customTextField(
              priceController,
              TextInputType.number,
              (value) {
                setState(() {
                  if (value != "") {
                    word = NumberToWord()
                        .convertNumberToWord(int.parse(value.trim()));
                  } else {
                    word = "";
                  }
                });
              },
              IsDetailsScreen: true,
              validator: (value) {
                if (value!.isEmpty) {
                  errorMessagePrice.value =
                      'Declare Some Amount'; // Set the error message

                  return "Declare Some Amount";
                } else {
                  errorMessagePrice.value = "";

                  return null;
                }
              }),

          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 5.h),
            child: Text(
              word,
              style: ABEEZEFONTTEXT.copyWith(fontSize: 12.sp),
            ),
          ),

          ErrorMessageListerner(errorMessage: errorMessagePrice),
          WidgetDivder(),

          //*******************BEDROOMS ********************************/

          textTitle("BedRooms *", textcolor: bedRoomTitleColor),
          SizedBox(
            height: 5.h,
          ),
          Obx(() {
            return Wrap(
              children: lIController.BedroomList.map((subtype) {
                int index = lIController.BedroomList.indexOf(subtype);
                int controllervalue = lIController.selectedbedroomIndex.value;
                return OPTIONWIDGET(() {
                  lIController.setBedRoomListIndex(index);
                  isBedRoomStateSelected = true;
                  errorMessageForBedRooms();
                },
                    index == controllervalue
                        ? Colors.green
                        : Colors.grey.shade300,
                    index == controllervalue
                        ? Colors.green.shade100.withOpacity(0.3)
                        : Colors.transparent,
                    index == controllervalue ? Colors.green : Colors.grey,
                    index,
                    subtype);
              }).toList(),
            );
          }),
          WidgetDivder(),
          // *****************************BATHROOOMS***************

          textTitle("BathsRooms *", textcolor: bathRoomTitleColor),
          SizedBox(
            height: 5.h,
          ),
          Obx(() {
            return Wrap(
              children: lIController.BathroomList.map((subtype) {
                int index = lIController.BathroomList.indexOf(subtype);
                int controllervalue = lIController.selectedbathrommIndex.value;
                return OPTIONWIDGET(() {
                  lIController.setBathroomListIndex(index);
                  isBathsRoomStateSelected = true;
                  errorMessageForBathRoom();
                },
                    index == controllervalue
                        ? Colors.green
                        : Colors.grey.shade300,
                    index == controllervalue
                        ? Colors.green.shade100.withOpacity(0.3)
                        : Colors.transparent,
                    index == controllervalue ? Colors.green : Colors.grey,
                    index,
                    subtype);
              }).toList(),
            );
          }),
          WidgetDivder(),
          //--------------------------------ADDRESS--------------------------------
          Padding(
              padding: EdgeInsets.only(
                left: 12.h,
              ),
              child: textTitle("Address *")),
          customTextField(
              addressController, TextInputType.streetAddress, (value) {},
              IsDetailsScreen: true, validator: (value) {
            if (value!.isEmpty && value.length < 20) {
              errorMessageAddress.value =
                  'Mention Full Location'; // Set the error message

              return "Mention Full Location";
            } else {
              errorMessageAddress.value = "";

              return null;
            }
          }),
          ErrorMessageListerner(errorMessage: errorMessageAddress),

          SizedBox(
            height: 20.h,
          ),
          WidgetDivder(),
          //--------------------------------Title--------------------------------

          Padding(
              padding: EdgeInsets.only(
                left: 12.h,
              ),
              child: textTitle("Title *")),
          customTextField(titleController, TextInputType.text, (value) {},
              IsDetailsScreen: true, validator: (value) {
            if (value!.isEmpty) {
              errorMessagetitle.value =
                  'Give Some Title'; // Set the error message

              return "Give Some Title";
            } else {
              errorMessagetitle.value = "";

              return null;
            }
          }),
          ErrorMessageListerner(errorMessage: errorMessagetitle),

          SizedBox(
            height: 20.h,
          ),
          WidgetDivder(),
          //--------------------------------DESCRIPTION--------------------------------
          Padding(
              padding: EdgeInsets.only(
                left: 12.h,
              ),
              child: textTitle("Description *")),
          customTextField(
              descriptionController,
              TextInputType.multiline,
              (value) {
                // ValidateForm();
              },
              IsDetailsScreen: true,
              validator: (value) {
                if (value != null && value.length < 20) {
                  errorMessageDescription.value = "Must be 20 characters";
                  return "Must be 20 characters";
                } else {
                  errorMessageDescription.value = "";
                  return null;
                }
              }),
          ErrorMessageListerner(errorMessage: errorMessageDescription),

          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
              onTap: () {
                isValidate = formKey.currentState!.validate();
                errorMessageForBathRoom();
                errorMessageForBedRooms();
                if (isValidate) {
                  //uploadImages();
                }

                //   print(LIController.selectedFurnishedStateIndex.value);
              },
              child: PostButton(
                  color: Colors.green, text: "Upload House Details")),

          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }

  void errorMessageForBedRooms() {
    if (!isBedRoomStateSelected) {
      setState(() {
        bedRoomTitleColor = Colors.red;
      });
    } else {
      setState(() {
        bedRoomTitleColor = Colors.grey.shade700;
      });
    }
  }

  void errorMessageForBathRoom() {
    if (!isBathsRoomStateSelected) {
      setState(() {
        bathRoomTitleColor = Colors.red;
      });
    } else {
      setState(() {
        bathRoomTitleColor = Colors.grey.shade700;
      });
    }
  }
}
