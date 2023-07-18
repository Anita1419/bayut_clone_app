import 'package:flutter/material.dart';

class SearchFilterListProvider extends ChangeNotifier {
  final List<String> _searchpageheaderlist = [
    "",
    "TruCheckᵀᴹ first",
    "Rent",
    "Property Type",
    "Rental Frequency",
    "Beds",
    "Price",
    "Area",
    "Baths",
    "All filters"
  ];

  List<String> get items => _searchpageheaderlist;

  void updateItem(int index, String value) {
    _searchpageheaderlist[index] = value;

    notifyListeners();
  }
}
