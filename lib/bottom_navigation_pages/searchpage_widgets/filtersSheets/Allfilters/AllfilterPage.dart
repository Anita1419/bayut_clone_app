import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/bathfilter.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/bedroomfilter.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/pricefilter.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/rentOrbuyfilter.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/rentalFrequencyFilter.dart';
import 'package:bayut_clone_app/constants/colorsconstants.dart';
import 'package:bayut_clone_app/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../searchpage_singlewidgets.dart';
import '../areafilter.dart';
import '../propertyTypeFilterBottomSheet.dart';
import 'allFilterheader.dart';

class AllFilterPage extends StatefulWidget {
  const AllFilterPage({super.key});

  @override
  State<AllFilterPage> createState() => _AllFilterPageState();
}

class _AllFilterPageState extends State<AllFilterPage> {
  bool _isBuyMode = false;
  bool _needsScroll = false;
  bool trucheckValue = false;
  ScrollController _scrollController = ScrollController();
  final GlobalKey _myWidgetKey = GlobalKey();

  _scrollToEnd() async {
    _scrollController.animateTo(
      _myWidgetKey.currentContext!.size!.height - 150.h,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  _scrollback() async {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _toggleExpansion() {
    setState(() {
      _isBuyMode = !_isBuyMode;

      if (_isBuyMode) {
        _needsScroll = true;
      } else {
        _needsScroll = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_needsScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
      _needsScroll = false;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollback());
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 30.h,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Filters",
            style: GoogleFonts.lato(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                textStyle: TextStyle(color: Colors.black))),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              //create the container  of startsearch
              AllFilterHeader(),
              RentBottomModalSheet(),

              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: darkgreenshade,
                          size: 25.h,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          "Location",
                          style: GoogleFonts.lato(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Buy or rent home by ',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'commute time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                        CupertinoSwitch(
                          value: _isBuyMode,
                          onChanged: (value) {
                            setState(() {
                              // _isBuyMode = !_isBuyMode;
                              //_isExpanded = !_isExpanded;
                              _toggleExpansion();
                              // _isBuyMode = value;
                              //  _saveToggleState();
                            });
                          },
                          activeColor:
                              _isBuyMode ? greenshade1 : Colors.grey.shade600,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    !_isBuyMode
                        ? _buildBuyModeContent()
                        : RepaintBoundary(
                            key: _myWidgetKey, child: _buildRentModeContent()),
                  ],
                ),
              ),
              Divider(
                height: 35.h,
                thickness: 1,
              ),

              Container(
                height: 200.h,
                child: PropertyTypeBottomSheet(
                  isAllFilterScreen: true,
                ),
              ),

              Divider(
                thickness: 1.h,
              ),

              Container(
                height: 100.h,
                child: RentalFrequencyFilter(
                  isFilterPage: true,
                ),
              ),

              Divider(
                thickness: 1.h,
              ),

              Container(
                height: 150.h,
                child: PriceFilter(
                  isFilterPage: true,
                ),
              ),

              Divider(
                thickness: 1.h,
              ),
              Container(
                height: 100.h,
                child: BedRoomFilter(
                  isFilterPage: true,
                ),
              ),
              Divider(
                thickness: 1.h,
              ),
              Container(
                height: 100.h,
                child: BathFilter(
                  isFilterPage: true,
                ),
              ),
              Divider(
                thickness: 1.h,
              ),
              Container(
                height: 150.h,
                child: AreaFilter(
                  isFilterPage: true,
                ),
              ),
              Divider(
                thickness: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBuyModeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            //move to next activity
          },
          child: filterContainer(
              "Search for a locality, area or city", DestinationField.None),
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          thickness: 1.h,
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Show ',
                style: GoogleFonts.lato(fontSize: 18.sp, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: '✓', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Tru"),
                  TextSpan(
                      text: "Check",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'ᵀᴹ'),
                  TextSpan(text: "  listings first")
                ],
              ),
            ),
            Icon(FontAwesomeIcons.circleExclamation),
            CupertinoSwitch(
              value: trucheckValue,
              onChanged: (value) {
                setState(() {
                  trucheckValue = !trucheckValue;
                });
              },
              activeColor: trucheckValue ? greenshade1 : Colors.grey.shade600,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRentModeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        filterContainer(
            "Enter first point of interest", DestinationField.FirstLocation),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Add your most important location (eg. your \n workplace)",
          style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
        ),
        SizedBox(
          height: 15.h,
        ),
        filterContainer(
            "Enter second point of interest", DestinationField.SecondLocation),
        SizedBox(height: 10.0),
        Text(
          "Add a secondary location ( eg. school, gym, etc)",
          style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 15.0),
        Divider(
          thickness: 1.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.bus_alert,
              color: darkgreenshade,
              size: 25.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text('Maximum Travel Time ',
                style: GoogleFonts.lato(
                    fontSize: 23.0, fontWeight: FontWeight.bold)),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              FontAwesomeIcons.circleExclamation,
              color: darkgreenshade,
              size: 25.h,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Slider(
          value: 10,
          min: 0,
          max: 100,
          onChanged: (value) {},
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          thickness: 1.h,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
