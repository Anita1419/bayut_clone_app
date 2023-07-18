import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/list_constants.dart';
import 'package:bayut_clone_app/constants/number_to_word_conversion.dart';
import 'package:bayut_clone_app/provider/ListController.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/FeaturesScreen.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/LandAndPostDetails.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/SharedWidgets.dart';
import 'package:bayut_clone_app/screens/SigningScreens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HouseDetailsWidget extends StatefulWidget {
  const HouseDetailsWidget({super.key});

  @override
  State<HouseDetailsWidget> createState() => _HouseDetailsWidgetState();
}

class _HouseDetailsWidgetState extends State<HouseDetailsWidget> {
  final ListItemController lIController = Get.find();

  //TEXTFIELD CONTROLLER VARIABLES
  final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  String word = "";
  String returenedFeatureList = "";
  bool isFurnishedStateSelected = false;
  bool isBedRoomStateSelected = false;
  bool isBathsRoomStateSelected = false;
  bool isConstructionStateSelected = false;
  bool isAreaUnitStateSelected = false;

  //VALIDATION VARAIABLE
  bool isValidate = false;

  //ERROR MESSAGE VARIABLES
  ValueNotifier<String> errorMessagePrice = ValueNotifier<String>('');
  ValueNotifier<String> errorMessageAddress = ValueNotifier<String>('');
  ValueNotifier<String> errorMessagearea = ValueNotifier<String>('');
  ValueNotifier<String> errorMessagetitle = ValueNotifier<String>('');
  ValueNotifier<String> errorMessageDescription = ValueNotifier<String>('');
  Color areaUnitTitleColor = Colors.grey.shade700;
  Color furnishedTitleStateColor = Colors.grey.shade700;
  Color bedRoomTitleColor = Colors.grey.shade700;
  Color bathRoomTitleColor = Colors.grey.shade700;
  Color constructionStateTitleColor = Colors.grey.shade700;

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

          //******************FURNISHING STATE********************************/

          textTitle("Furnished *", textcolor: furnishedTitleStateColor),
          SizedBox(
            height: 5.h,
          ),

          Obx(() {
            return Wrap(
              children: lIController.Furnishedlist.map((subtype) {
                int index = lIController.Furnishedlist.indexOf(subtype);
                int controllervalue =
                    lIController.selectedFurnishedStateIndex.value;
                return OPTIONWIDGET(() {
                  //selectItemFurnishingStateList(index);
                  lIController.setFurnishedStateIndex(index);
                  isFurnishedStateSelected = true;
                  errorMessageForFurnished();
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
                  isBedRoomStateSelected = true;
                  errorMessageForBedRooms();
                  lIController.setBedRoomListIndex(index);
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
                  isBathsRoomStateSelected = true;
                  errorMessageForBathRoom();
                  lIController.setBathroomListIndex(index);
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
          // ****************************CONSTRUCTION STATE *****************

          textTitle("Construction State*",
              textcolor: constructionStateTitleColor),
          SizedBox(
            height: 5.h,
          ),
          Obx(() {
            return Wrap(
              children: lIController.CSList.map((subtype) {
                int index = lIController.CSList.indexOf(subtype);
                int controllervalue = lIController.selectedCSIndex.value;
                return OPTIONWIDGET(() {
                  isConstructionStateSelected = true;
                  errorMessageForConstruction();
                  lIController.setCSListIndex(index);
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
          //------------------------------FEATURE-----------------------

          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textTitle("Features *"),
                        Text(
                          returenedFeatureList == ""
                              ? "None"
                              : returenedFeatureList,
                          style: ABEEZEFONTTEXT.copyWith(color: Colors.grey),
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final resultlist = await Get.to(
                          () => FeatureScreen(
                                listfeatures: HOUSES_FEATURES,
                              ),
                          opaque: false,
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500));

                      // Handle the returned list from Screen B
                      if (resultlist != null && resultlist is List<String>) {
                        List<String> returnedList = resultlist;
                        // Use the returned list in Screen A
                        print(returnedList);
                        setState(() {
                          returenedFeatureList = returnedList.join(', ');
                        });
                      }
                      // ValidateForm();
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              )),

          WidgetDivder(),

          //--------------------------------AREA UNIT--------------------------------

          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: textTitle("Area Unit *", textcolor: areaUnitTitleColor)),
          SizedBox(
            height: 5.h,
          ),
          Wrap(
            children: AreaUnit.map((subtype) {
              int index = AreaUnit.indexOf(subtype);

              return OPTIONWIDGET(() {
                selectItemUnitList(index);
                errorMessageForAreaList();
              },
                  isAreaUnitSelected[index]
                      ? Colors.green
                      : Colors.grey.shade300,
                  isAreaUnitSelected[index]
                      ? Colors.green.shade100.withOpacity(0.3)
                      : Colors.transparent,
                  isAreaUnitSelected[index] ? Colors.green : Colors.grey,
                  index,
                  subtype);
            }).toList(),
          ),

          WidgetDivder(),
          //////--------------------------AREA TEXTFIELD --------------------------/////
          Padding(
              padding: EdgeInsets.only(
                left: 12.h,
              ),
              child: textTitle("Area *")),
          customTextField(areaController, TextInputType.number, (value) {},
              IsDetailsScreen: true, validator: (value) {
            if (value!.isEmpty) {
              errorMessagearea.value =
                  'Declare Estimated Area'; // Set the error message

              return "Declare Some Area";
            } else {
              errorMessagearea.value = "";

              return null;
            }
          }),
          ErrorMessageListerner(errorMessage: errorMessagearea),

          SizedBox(
            height: 20.h,
          ),
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
          //--------------------------------TITLE--------------------------------

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

          //-----------------------Button------------------
          GestureDetector(
              onTap: () {
                isValidate = formKey.currentState!.validate();
                errorMessageForFurnished();
                errorMessageForBedRooms();
                errorMessageForBathRoom();
                errorMessageForConstruction();
                errorMessageForAreaList();

                // print(FirebaseAuthHelper(FirebaseAuth.instance).user.uid);
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

  //----------------AREA UNIT SELECTION-----------------------------------------------
  List<bool> isAreaUnitSelected = List.filled(AreaUnit.length, false);
  String selectedAreaType = ''; // Variable to hold the selected item
  void selectItemUnitList(int index) {
    setState(() {
      isAreaUnitSelected =
          List.filled(AreaUnit.length, false); // Deselect all items
      isAreaUnitSelected[index] = true; // Select the tapped item
      selectedAreaType = AreaUnit[index]; // Update the selected item
    });
  }

  void errorMessageForAreaList() {
    if (selectedAreaType.isEmpty) {
      setState(() {
        areaUnitTitleColor = Colors.red;
      });
    } else {
      setState(() {
        areaUnitTitleColor = Colors.grey.shade700;
      });
    }
  }

  void errorMessageForFurnished() {
    if (!isFurnishedStateSelected) {
      setState(() {
        furnishedTitleStateColor = Colors.red;
      });
    } else {
      setState(() {
        furnishedTitleStateColor = Colors.grey.shade700;
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

  void errorMessageForConstruction() {
    if (!isConstructionStateSelected) {
      setState(() {
        constructionStateTitleColor = Colors.red;
      });
    } else {
      setState(() {
        constructionStateTitleColor = Colors.grey.shade700;
      });
    }
  }
}
