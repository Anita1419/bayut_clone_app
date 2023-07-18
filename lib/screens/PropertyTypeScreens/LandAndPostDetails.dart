import 'package:bayut_clone_app/Widgets/customSnackBar.dart';
import 'package:bayut_clone_app/constants/list_constants.dart';
import 'package:bayut_clone_app/provider/FirebaseStorageGetController.dart';
import 'package:bayut_clone_app/provider/ListController.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/FeaturesScreen.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/SharedWidgets.dart';
import 'package:bayut_clone_app/screens/SigningScreens/signup_screen.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colorsconstants.dart';
import '../../constants/number_to_word_conversion.dart';
import '../../models/PostModel.dart';

class LandAndPostDetails extends StatefulWidget {
  final List<XFile> selectedImages;
  final String category;
  final String propertSaleType;
  const LandAndPostDetails(
      {super.key,
      required this.selectedImages,
      required this.category,
      required this.propertSaleType});

  @override
  State<LandAndPostDetails> createState() => _LandAndPostDetailsState();
}

class _LandAndPostDetailsState extends State<LandAndPostDetails> {
  //TEXTEDITINGCONTROLLERS VARAIBALES
  final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  String word = "";
  String returenedFeatureList = "";

  //VALIDATION VARAIABLES
  bool isValidate = false;

  //ERROR VARAIALBLE (EACH OF ONE TEXTFIELD)
  ValueNotifier<String> errorMessagePrice = ValueNotifier<String>('');
  ValueNotifier<String> errorMessageAddress = ValueNotifier<String>('');
  ValueNotifier<String> errorMessagearea = ValueNotifier<String>('');
  ValueNotifier<String> errorMessagetitle = ValueNotifier<String>('');
  ValueNotifier<String> errorMessageDescription = ValueNotifier<String>('');
  Color areaUnitTitleColor = Colors.grey.shade700;
  Color typeTitleColor = Colors.grey.shade700;
  bool isTypeSelected = false;

  //CONTROLLER WIDGET
  final ListItemController lIController = Get.find();

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

  // FORM VALIDATION METHODS
  void ValidateForm() {
    if (formKey.currentState!.validate() &&
        selectedAreaType.isNotEmpty &&
        isTypeSelected &&
        widget.selectedImages.isNotEmpty) {
      setState(() {
        isValidate = true;
      });
    } else {
      setState(() {
        isValidate = false;
      });
    }
  }

  void ErrorMessageForAreaList() {
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

  void ErrorMessageForTypeList() {
    if (!isTypeSelected) {
      setState(() {
        typeTitleColor = Colors.red;
      });
    } else {
      setState(() {
        typeTitleColor = Colors.grey.shade700;
      });
    }
  }

  void ClearFields() {
    setState(() {
      widget.selectedImages.clear();
      priceController.clear();
      lIController.deslectPropertyTypeItems();
      returenedFeatureList = "";
      isAreaUnitSelected = List.filled(AreaUnit.length, false);
      areaController.clear();
      addressController.clear();
      titleController.clear();
      descriptionController.clear();
    });
  }

//FIREBASE METHODS FOR UPLOAD THE DATA

  final FirebaseStorageGetController firebaseStorageController =
      Get.put(FirebaseStorageGetController());
  final FirebaseAuthHelper firebaseAuthHelper =
      Get.put(FirebaseAuthHelper(FirebaseAuth.instance));

  void uploadImages() async {
    // Call the upload method from the ImageUploadController
    await firebaseStorageController
        .uploadImages(widget.selectedImages, context)
        .then((value) {
      firebaseStorageController
          .createPost(
              PostModel(
                  category: widget.category,
                  subcategory: widget.propertSaleType,
                  price: double.parse(priceController.text),
                  type: PROPERTYTYPESUBLIST[
                      lIController.selectedPropertyIndex.value],
                  features: returenedFeatureList.isEmpty
                      ? "None"
                      : returenedFeatureList,
                  areaUnit: selectedAreaType,
                  area: double.parse(areaController.text.toString()),
                  title: titleController.text.toString(),
                  description: descriptionController.text.toString(),
                  imageUrls: value!,
                  userId: firebaseAuthHelper.user.uid),
              context)
          .then((value) {
        ClearFields();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("The value of controller is ");
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------------PRICE --------------------------------
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
          //  textTitle(word.isEmpty ? "" : word)

          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 5.h),
            child: Text(
              word,
              style: ABEEZEFONTTEXT.copyWith(fontSize: 12.sp),
            ),
          ),
          ErrorMessageListerner(errorMessage: errorMessagePrice),

          WidgetDivder(),

          //--------------------------------TYPE --------------------------------

          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: textTitle("Type *", textcolor: typeTitleColor)),
          SizedBox(
            height: 5.h,
          ),
          Obx(() {
            return Wrap(
              children: lIController.PropertyTypeList.map((subtype) {
                int index = lIController.PropertyTypeList.indexOf(subtype);
                int controllervalue = lIController.selectedPropertyIndex.value;
                return OPTIONWIDGET(() {
                  isTypeSelected = true;
                  ErrorMessageForTypeList();
                  lIController.setPropertySubTypeListIndex(index);
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
                                listfeatures: LANDANDPLOTFeatures,
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
                ErrorMessageForAreaList();
                // ValidateForm();
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
              addressController,
              TextInputType.streetAddress,
              (value) {
                // ValidateForm();
              },
              IsDetailsScreen: true,
              validator: (value) {
                if (value!.isEmpty && value.length < 20) {
                  errorMessageAddress.value =
                      'Mention Full Location'; // Set the error message

                  return "Mention Full Location";
                } else {
                  errorMessageAddress.value = "";

                  return null;
                }
              }),
          //  textTitle(word.isEmpty ? "" : word)
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
              child: textTitle("Title *", textcolor: areaUnitTitleColor)),
          customTextField(
              titleController,
              TextInputType.text,
              (value) {
                //  ValidateForm();
              },
              IsDetailsScreen: true,
              validator: (value) {
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
                // print(FirebaseAuthHelper(FirebaseAuth.instance).user.uid);
                isValidate = formKey.currentState!.validate();
                ErrorMessageForAreaList();
                ErrorMessageForTypeList();
                if (isValidate) {
                  uploadImages();
                } else {
                  showSnackBar(context,
                      "Some Information is Missing \n Check the field");
                }
              },
              child: PostButton(color: Colors.green, text: "Upload Property")),

          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}

class ErrorMessageListerner extends StatelessWidget {
  const ErrorMessageListerner({
    super.key,
    required this.errorMessage,
  });

  final ValueNotifier<String> errorMessage;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: errorMessage,
      builder: (context, value, _) {
        if (value.isNotEmpty) {
          return Text(
            value,
            style: GoogleFonts.aclonica(
              color: Colors.red,
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

Widget OPTIONWIDGET(VoidCallback onTap, Color bordercolor, Color filledColor,
    Color textColor, int index, String item) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: bordercolor,
          width: 1.0,
        ),
        color: filledColor,
      ),
      child: Text(
        item,
        style: ABEEZEFONTTEXT.copyWith(color: textColor, fontSize: 12.sp),
      ),
    ),
  );
}
