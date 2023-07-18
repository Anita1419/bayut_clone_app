import 'dart:io';
import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/temporary_constants.dart';
import 'package:bayut_clone_app/provider/FirebaseStorageGetController.dart';
import 'package:bayut_clone_app/provider/ListController.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/ApartmentDetailsWidget.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/CommercialDetailsWidget.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/HouseDetailsWidgets.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/LandAndPostDetails.dart';
import 'package:bayut_clone_app/screens/CreatePostScreens/SharedWidgets.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/RoomDetailsWidget.dart';
import 'package:bayut_clone_app/screens/PropertyTypeScreens/VacationRentalDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostEntryScreen extends StatefulWidget {
  final String category;
  final String propertSaleType;
  const PostEntryScreen(
      {super.key, required this.category, required this.propertSaleType});

  @override
  State<PostEntryScreen> createState() => _PostEntryScreenState();
}

class _PostEntryScreenState extends State<PostEntryScreen>
    with SingleTickerProviderStateMixin {
  //VARIABLES OF BOTTOM SHEET DIALOG BOX
  late AnimationController animationController;
  late Animation<double> animation;
  bool _isOpened = false;
  // bool _isLoading = false;

  final ListItemController LIController = Get.put(ListItemController());

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void _toggleContainer() {
    setState(() {
      _isOpened = !_isOpened;
      if (_isOpened) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  // //----------------AREA UNIT SELECTION-----------------------------------------------
  // List<bool> isAreaUnitSelected = List.filled(AreaUnit.length, false);
  // String selectedAreaType = ''; // Variable to hold the selected item

  // void selectItemUnitList(int index) {
  //   setState(() {
  //     isAreaUnitSelected =
  //         List.filled(AreaUnit.length, false); // Deselect all items
  //     isAreaUnitSelected[index] = true; // Select the tapped item
  //     selectedAreaType = AreaUnit[index]; // Update the selected item
  //   });
  // }

  //VARIABLES OF IMAGE PICKER
  List<XFile> _selectedImages = [];
  ImageSource? globalImageSource;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();

    if (source == ImageSource.camera) {
      //  final pickedFile = await picker.getImage(source: source);
      XFile? file = await picker.pickImage(source: source);
      if (file != null) {
        setState(() {
          _selectedImages.add(XFile(file.path));
        });
      }
    } else if (source == ImageSource.gallery) {
      final List<XFile> selectedGalleryImages = await picker.pickMultiImage();
      if (selectedGalleryImages.isNotEmpty) {
        setState(() {
          _selectedImages.addAll(selectedGalleryImages);
        });
      }
    }
  }

  //VARIABLES FOR TEXTEDITING FIELDS
  // TextEditingController priceController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController titleController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  // TextEditingController areaController = TextEditingController();
  // String word = "";
  // String returenedFeatureList = "";
  // bool isValidate = false;

  // ValidateForm() {
  //   if (priceController.text.isNotEmpty &&
  //       addressController.text.isNotEmpty &&
  //       titleController.text.isNotEmpty &&
  //       descriptionController.text.isNotEmpty &&
  //       _selectedImages.isNotEmpty &&
  //       _selectedImages.length > 4 &&
  //       isAreaUnitSelected.contains(true) &&
  //       returenedFeatureList.isNotEmpty &&
  //       LIController.selectedPropertyIndex != Rx(-1)) {
  //     setState(() {
  //       isValidate = true;
  //     });
  //   } else {
  //     setState(() {
  //       isValidate = false;
  //     });
  //   }
  // }

  // //VARIABLES OF FIREBASE
  // bool isUploading = false;
  final FirebaseStorageGetController firebaseStorageController =
      Get.put(FirebaseStorageGetController());
  // final FirebaseAuthHelper firebaseAuthHelper =
  //     Get.put(FirebaseAuthHelper(FirebaseAuth.instance));

  // void uploadImages() async {
  //   // Call the upload method from the ImageUploadController
  //   await firebaseStorageController
  //       .uploadImages(_selectedImages, context)
  //       .then((value) {
  //     firebaseStorageController
  //         .createPost(
  //             PostModel(
  //                 category: widget.category,
  //                 subcategory: widget.propertSaleType,
  //                 price: double.parse(priceController.text),
  //                 type: PROPERTYTYPESUBLIST[
  //                     LIController.selectedPropertyIndex.value],
  //                 features: returenedFeatureList,
  //                 areaUnit: selectedAreaType,
  //                 area: double.parse(areaController.text.toString()),
  //                 title: titleController.text.toString(),
  //                 description: descriptionController.text.toString(),
  //                 imageUrls: value!,
  //                 userId: firebaseAuthHelper.user.uid),
  //             context)
  //         .then((value) {
  //       ClearAllField();
  //     });
  //   });
  // }

  // void ClearAllField() {
  //   setState(() {
  //     _selectedImages.clear();
  //     priceController.clear();
  //     returenedFeatureList = "";
  //     areaController.clear();
  //     addressController.clear();
  //     titleController.clear();
  //     descriptionController.clear();
  //     isAreaUnitSelected =
  //         List.filled(AreaUnit.length, false); // Deselect all items

  //     word = ""; // Deselect all items
  //     isValidate = false;
  //     LIController.setPropertySubTypeListIndex(-1);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isOpened) {
          setState(() {
            animationController.reverse();
            _isOpened = false;
          });
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                "Include Some Details",
                style: ABEEZEFONTTEXT.copyWith(
                    fontSize: 18.sp, color: Colors.black),
              ),
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Upload The Property Images At Least Four",
                        style: ABEEZEFONTTEXT),

                    _selectedImages.isNotEmpty
                        ? GestureDetector(
                            onTap: _toggleContainer,
                            child: BannerOfUploadMoreImage(
                                context: context,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Upload More Images Tap Here",
                                        style: ABEEZEFONTTEXT.copyWith(
                                            color: more_page_button_color)),
                                    InkWell(
                                      onTap: _toggleContainer,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: more_page_button_color,
                                      ),
                                    )
                                  ],
                                )),
                          )
                        : Container(),
                    SizedBox(
                      height: 20.h,
                    ),
                    _selectedImages.isEmpty
                        ? UploadImageWidget(
                            onContainerTapped: _toggleContainer,
                          )
                        : Container(
                            height: 120.h,
                            child: ReorderableListView.builder(
                              onReorder: ((oldIndex, newIndex) {
                                setState(() {
                                  if (newIndex > oldIndex) {
                                    newIndex--;
                                  }
                                  final item =
                                      _selectedImages.removeAt(oldIndex);
                                  _selectedImages.insert(newIndex, item);
                                });
                              }),
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedImages.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PostImageWidget(
                                    ValueKey(_selectedImages[index]),
                                    File(_selectedImages[index].path), () {
                                  setState(() {
                                    _selectedImages.removeAt(index);
                                  });
                                });
                              },
                            ),
                          ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //------------------CATEGORY------------------------------------------

                    PropertyTypeTextWidget(
                      propertySaleType: widget.propertSaleType,
                      propertyType: widget.category,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    // LAYOUT ACCORDING TO TYPE OF PROPERTY

                    if (widget.category == LANDANDPLOTS) ...[
                      LandAndPostDetails(
                        selectedImages: _selectedImages,
                        category: widget.category,
                        propertSaleType: widget.propertSaleType,
                      )
                    ] else if (widget.category == HOUSES) ...[
                      HouseDetailsWidget()
                    ] else if (widget.category == APARTMENTSANDFLATS) ...[
                      ApartmentDetailsWidget()
                    ] else if (widget.category == PORTIONSANDFLOORS) ...[
                      ApartmentDetailsWidget()
                    ] else if (widget.category ==
                        SHOP_OFFICES_COMMERCIAL_SPACE) ...[
                      CommercialDetailsWidget()
                    ] else if (widget.category == ROOMS ||
                        widget.category == PAYINGGUEST) ...[
                      RoomDetailsWidget()
                    ] else if (widget.category == VACATION_RENTALS) ...[
                      VacationRentalDetailsWidget()
                    ]
                  ],
                ),
              ),
            ),
            bottomSheet: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return ChildAnimatedBuilder(animation.value,
                    onCameraClicked: () {
                  // Handle option 1 selection
                  //  ValidateForm();
                  _getImage(ImageSource.camera);
                  if (_isOpened) {
                    setState(() {
                      animationController.reverse();
                      _isOpened = false;
                      globalImageSource = ImageSource.camera;
                    });
                  }
                }, onGalleryClicked: () {
                  // ValidateForm();
                  _getImage(ImageSource.gallery);
                  if (_isOpened) {
                    setState(() {
                      animationController.reverse();
                      _isOpened = false;
                      globalImageSource = ImageSource.gallery;
                    });
                  }
                }, onExitClicked: () {
                  // ValidateForm();
                  print(_selectedImages.length);

                  if (_isOpened) {
                    setState(() {
                      animationController.reverse();
                      _isOpened = false;
                    });
                  }
                });
              },
            ),
          ),
          Obx(() {
            final isUploading = firebaseStorageController.isUploading;
            final progress = firebaseStorageController.progress;

            return isUploading ? loadingWidget(progress) : Container();
          }),
        ],
      ),
    );
  }
}
