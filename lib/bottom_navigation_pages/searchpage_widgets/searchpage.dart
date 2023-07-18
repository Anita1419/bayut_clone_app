import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/areafilter.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/bedroomfilter.dart';

import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/propertyTypeFilterBottomSheet.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/rentalFrequencyFilter.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/listviewfilterItems.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/search_header.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/searchpage_singlewidgets.dart';
import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/list_constants.dart';
import 'package:bayut_clone_app/provider/searchfilterlistprovider.dart';
import 'package:bayut_clone_app/provider/searchpage_provider/Rentandbuyfilterprovider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/route_constants.dart';
import 'filtersSheets/bathfilter.dart';
import 'filtersSheets/pricefilter.dart';
import 'filtersSheets/rentOrbuyfilter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSwitched = false;
  final List<bool> _selectedhomeType = <bool>[true, false, false];

  List<CarouselController> listcarourselController = [];
  List<int> listindexs = [];
  List<bool> filterSelected = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchpageheaderlist = Provider.of<SearchFilterListProvider>(context);
    final rentbuylistprovider = Get.find<RentAndBuyProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 20.0, top: 5.h),
                    child: Search_header(
                        saveOnClicked: () {}, locationOnClicked: () {}),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //ListViewFirstItem()
                  SizedBox(
                    height: 35.h,
                    child: ListView.builder(
                        itemCount: searchpageheaderlist.items.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          filterSelected.add(false);
                          return index == 0
                              ? listViewFirstItem()
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      filterSelected[index] = true;
                                    });
                                    // this is Rent Filter clicked
                                    if (index == 2) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const RentBottomModalSheet();
                                          }).then((value) {
                                        print(searchpageheaderlist.items[2]);
                                        searchpageheaderlist.updateItem(
                                            2,
                                            rentbuylistprovider.items[0]
                                                ? "Rent"
                                                : "Buy");
                                      });
                                    }
                                    // this is for the propertType
                                    if (index == 3) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return PropertyTypeBottomSheet(
                                              isAllFilterScreen: false,
                                            );
                                          });
                                    }
                                    //this is for the rental frequency
                                    if (index == 4) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const RentalFrequencyFilter(
                                              isFilterPage: false,
                                            );
                                          });
                                    }
                                    // this is bed room filter
                                    if (index == 5) {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const BedRoomFilter(
                                              isFilterPage: false,
                                            );
                                          });
                                    }
                                    if (index == 6) {
                                      //for price
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const PriceFilter(
                                              isFilterPage: false,
                                            );
                                          });
                                    }

                                    if (index == 7) {
                                      // for area
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AreaFilter(
                                              isFilterPage: false,
                                            );
                                          });
                                    }

                                    if (index == 8) {
                                      //for bath

                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const BathFilter(
                                              isFilterPage: false,
                                            );
                                          });
                                    }

                                    if (index == 9) {
                                      //for bath

                                      Navigator.pushNamed(
                                          context, allFiltersPage);
                                    }
                                  },
                                  child: listViewFilter(
                                    text: searchpageheaderlist.items[index],
                                    index: index,
                                    isSelected: filterSelected[index],
                                    truCheckFirstClicked: () {
                                      setState(() {
                                        filterSelected[index] =
                                            !filterSelected[index];
                                      });
                                    },
                                  ),
                                );
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 30.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    decoration: BoxDecoration(
                        color: greenshade3,
                        border: const Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Show TruCheckᵀᴹ listings first",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: greenshade1),
                        ),
                        Transform.scale(
                          scaleY: 0.9,
                          scaleX: 1.0,
                          child: CupertinoSwitch(
                            onChanged: (value) {
                              setState(() {
                                isSwitched = !isSwitched;
                              });
                            },
                            value: isSwitched,
                            activeColor:
                                isSwitched ? greenshade1 : Colors.grey.shade600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listhomeviews.length,
                itemBuilder: (BuildContext context, int listindex) {
                  listcarourselController.add(CarouselController());
                  listindexs.add(0);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      listindex == 0
                          ? Container(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03,
                                  right:
                                      MediaQuery.of(context).size.width * 0.03),
                              height: 40.h,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List<Widget>.generate(
                                    hometypelist.length, (int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        for (int i = 0;
                                            i < _selectedhomeType.length;
                                            i++) {
                                          _selectedhomeType[i] = i == index;
                                        }
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          border: _selectedhomeType[index]
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(
                                                  color: Colors.grey,
                                                  width: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: _selectedhomeType[index]
                                              ? greenshade2
                                              : Colors.transparent),
                                      child: Text(
                                        hometypelist[index],
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          color: _selectedhomeType[index]
                                              ? greenColor
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController:
                                listcarourselController[listindex],
                            options: CarouselOptions(
                                height: 190,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    listindexs[listindex] = index;
                                  });
                                }),
                            itemCount:
                                listhomeviews[listindex].homeimages.length,
                            itemBuilder: (context, index, realIndex) {
                              final urlImage =
                                  listhomeviews[listindex].homeimages[index];
                              return buildImage(urlImage, index, context);
                            },
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              heightFactor: 12.h,
                              child: buildIndicator(
                                  listindex, listindexs[listindex])),
                          Positioned(
                            top: 70.h,
                            left: 20.h,
                            child: GestureDetector(
                              onTap: () {
                                print("not clickable");
                                listcarourselController[listindex]
                                    .previousPage();
                              },
                              child:
                                  backButton(Icons.arrow_back_ios_new_rounded),
                            ),
                          ),
                          Positioned(
                            top: 70.h,
                            right: 20.h,
                            child: GestureDetector(
                                onTap: () {
                                  print(" clickable");
                                  listcarourselController[listindex].nextPage(
                                      duration:
                                          const Duration(milliseconds: 500));
                                },
                                child: backButton(
                                    Icons.arrow_forward_ios_rounded)),
                          ),
                          Positioned(
                            top: 10.h,
                            left: 15.h,
                            child: GestureDetector(
                              onTap: () {},
                              child: TruChecklabel(context),
                            ),
                          ),
                          Positioned(
                              top: 1.h,
                              right: 5.h,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AED 340,000",
                              style: GoogleFonts.lato(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.bed,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "3",
                                      style: GoogleFonts.lato(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.bath,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "4",
                                      style: GoogleFonts.lato(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.borderAll,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "2,288 sqft",
                                      style: GoogleFonts.lato(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Amber,Tiara Residences , palm jumeirah Dubai United States",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(index, activeindexbuild) {
    return AnimatedSmoothIndicator(
      activeIndex: activeindexbuild,
      count: listhomeviews[index].homeimages.length,
      effect: const ScrollingDotsEffect(
          dotWidth: 10, dotHeight: 10, activeDotColor: Colors.white),
    );
  }
}
