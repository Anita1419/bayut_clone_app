import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MorePageItem {
  String title;
  String iconData;
  MorePageItem({
    required this.title,
    required this.iconData,
  });
}

List<MorePageItem> morepagelistoptions = [
  MorePageItem(
      title: "Floor Plans", iconData: "assets/images/floorplan_icon.png"),
  MorePageItem(
      title: "Manage Alerts", iconData: "assets/images/managealert_icon.png"),
  MorePageItem(title: "Blog", iconData: "assets/images/blog_icon.png"),
  MorePageItem(title: "Guides", iconData: "assets/images/guides_icon.png"),
  MorePageItem(
      title: "Property Awards 2022",
      iconData: "assets/images/property awards.png"),
  MorePageItem(title: "B3DXB 2022", iconData: "assets/images/b3dxb_icon.png"),
  MorePageItem(title: "Settings", iconData: "Icons.settings"),
  MorePageItem(title: "Contact Us", iconData: "Icons.contact_mail"),
  MorePageItem(title: "About Us", iconData: "assets/images/about_icon.png"),
  MorePageItem(
      title: "Privacy Policy", iconData: "assets/images/privacy policy.png"),
  MorePageItem(title: "Log Out", iconData: "Icons.logout")
];

// List<String> searchpageheaderlist = [
//   "",
//   "TruCheckᵀᴹ first",
//   "Rent",
//   "Property Type",
//   "Rental Frequency",
//   "Beds",
//   "Price",
//   "Area",
//   "Baths",
//   "Viewing options",
//   "All filters"
// ];

List<String> hometypelist = ["All", "Furnished", "Unfurnished"];

class HomeViews {
  List<String> homeimages;
  HomeViews({
    required this.homeimages,
  });
}

List<HomeViews> listhomeviews = [
  HomeViews(homeimages: [
    "https://images.unsplash.com/photo-1615915613497-0ee591aa2fe6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=80",
    "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1613685703237-6628de38ddb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlZCUyMHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"
  ]),
  HomeViews(homeimages: [
    "https://images.unsplash.com/photo-1522050212171-61b01dd24579?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "https://images.unsplash.com/photo-1595526051245-4506e0005bd0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVkJTIwcm9vbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1613685703237-6628de38ddb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlZCUyMHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"
  ]),
  HomeViews(homeimages: [
    "https://images.unsplash.com/photo-1615915613497-0ee591aa2fe6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=80",
    "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://media.istockphoto.com/id/88620985/photo/exterior-of-modern-house-and-swimming-pool.jpg?s=1024x1024&w=is&k=20&c=fcfN1iIOMcuhlCn-4noOPYXmUo6Td6gp9sn5s2lxtEE=",
    "https://images.unsplash.com/photo-1615552269451-903ecf1f7b9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  ]),
  HomeViews(homeimages: [
    "https://images.unsplash.com/photo-1522050212171-61b01dd24579?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "https://images.unsplash.com/photo-1595526051245-4506e0005bd0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmVkJTIwcm9vbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1613685703237-6628de38ddb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlZCUyMHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"
  ]),
];

List<String> BATHROOMOPTIONS = [
  '1',
  '2',
  '3',
  '4',
  "5",
  "6+",
];

List<String> BEDSOPTION = ['Studio', '1', '2', '3', '4', "5", "6", "7", "8+"];

class PropertyFilters {
  String title;
  IconData iconData;

  PropertyFilters({required this.title, required this.iconData});
}

List<PropertyFilters> residentialOptions = [
  PropertyFilters(
      title: "Apartment", iconData: FontAwesomeIcons.houseChimneyCrack),
  PropertyFilters(title: "Villa", iconData: FontAwesomeIcons.buildingColumns),
  PropertyFilters(title: "Townhouse", iconData: FontAwesomeIcons.building),
  PropertyFilters(title: "Penthouse", iconData: FontAwesomeIcons.home),
  PropertyFilters(
      title: "Villa Compound", iconData: FontAwesomeIcons.addressBook),
  PropertyFilters(title: "Hotel Apartments", iconData: FontAwesomeIcons.hotel),
  PropertyFilters(
      title: "Residential Plot", iconData: FontAwesomeIcons.pooBolt),
  PropertyFilters(
      title: "Residential Floor", iconData: FontAwesomeIcons.houseFloodWater),
  PropertyFilters(
      title: "Residential Building", iconData: FontAwesomeIcons.house),
];

List<PropertyFilters> commercialOptions = [
  PropertyFilters(title: 'Offices', iconData: FontAwesomeIcons.buildingShield),
  PropertyFilters(title: 'Shops', iconData: FontAwesomeIcons.shop),
  PropertyFilters(title: 'Warehouse', iconData: FontAwesomeIcons.shopSlash),
  PropertyFilters(title: "Labour Camp", iconData: FontAwesomeIcons.shopify),
  PropertyFilters(
      title: "Commercial Villa", iconData: FontAwesomeIcons.shopware),
  PropertyFilters(title: "Bulk Units", iconData: FontAwesomeIcons.bridgeLock),
  PropertyFilters(title: "Commercial Plot", iconData: FontAwesomeIcons.pooBolt),
  PropertyFilters(
      title: "Commercial Floor", iconData: FontAwesomeIcons.goodreads),
  PropertyFilters(
      title: "Commercial Building", iconData: FontAwesomeIcons.bitbucket),
  PropertyFilters(title: "Factory", iconData: FontAwesomeIcons.fireBurner),
  PropertyFilters(
      title: "Industrial Land", iconData: FontAwesomeIcons.industry),
  PropertyFilters(
      title: "Mixed Use Land", iconData: FontAwesomeIcons.landMineOn),
  PropertyFilters(title: "Showroom", iconData: FontAwesomeIcons.car),
  PropertyFilters(
      title: "Other Commercial", iconData: FontAwesomeIcons.gripHorizontal)
];

List<String> PROPERTYTYPESUBLIST = [
  "Agricultural land",
  "commercial plots",
  "files",
  "Industrial land",
  "residential plots",
  "plot form"
];

List<String> AreaUnit = [
  "KANAL",
  "MARLA",
  "SQUARE FEET",
  "SQUARE METER",
  "SQUARE YARDS"
];

List<String> LANDANDPLOTFeatures = [
  "Corner Plot",
  "Park Facing",
  "Disputed",
  "Sewerage",
  "Electricity",
  "Water Supply",
  "Gas Supply",
  "Boundry Wall"
];

List<String> FURNISHINGSTATE = ["Furnished", "UnFurnished"];

List<String> CONSTRUCTIONSTATE = ["Grey Structure", "Finished"];

List<String> HOUSES_FEATURES = [
  "Servant Quarters",
  "Drawing Room",
  "Dining Room",
  "Kitchen",
  "Study Room",
  "Prayer Room",
  "Powder Room",
  "Gym",
  "Store Room",
  "Steam Room",
  "Lounge or Sitting Room",
  "Laundry Room"
];

List<String> FLOORLEVEL_LIST = ["1", "2", "3", "4", "5", "6", "7+", "Ground"];

List<String> COMMERCIAL_TYPE_LIST = [
  "OFFICE",
  "SHOP",
  "WAREHOUSE",
  "FACTORY",
  "BUILDING"
];
List<String> COMMERCIAL_FEATURES = [
  "PARKING",
  "LOBBY IN BUILDING",
  "DOUBLE GLAZED WINDOWS",
  "CENTRAL AIR CONDITIONING",
  "CENTRAL HEATING",
  "ELECTRICITY BACKUP",
  "WASTE DISPOSAL",
  "ELEVATORS"
];

List<String> ROOM_TYPE_LIST = ["Single", "Double"];
