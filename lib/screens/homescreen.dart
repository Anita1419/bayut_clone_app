import 'package:bayut_clone_app/bottom_navigation_pages/homepage.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/morepage_widgets/morepage.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/savedpage.dart';
import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../provider/searchpage_provider/Rentandbuyfilterprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const SearchPage(),
    const SavedPage(),
    const MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RentAndBuyProvider());
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: currentIndex,
        onTap: (index) {
          print("clicked");
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_filled,
              color: Colors.grey,
            ),
            activeIcon: Container(
              height: 20.h,
              width: 20.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/home_icon_selected.png"))),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            activeIcon: Container(
              height: 20.h,
              width: 20.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/search_icon_selected.png"))),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.bookmark_border_outlined,
              color: Colors.grey,
            ),
            activeIcon: Container(
              height: 20.h,
              width: 20.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/saved_selected.png"))),
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
            activeIcon: Container(
              height: 20.h,
              width: 20.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/more_selected.png"))),
            ),
            label: 'More',
          )
        ],
      ),
    );
  }
}
