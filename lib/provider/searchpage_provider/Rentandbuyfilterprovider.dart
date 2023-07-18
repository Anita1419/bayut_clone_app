import 'package:get/get.dart';

class RentAndBuyProvider extends GetxController {
  final List<bool> _itemsrentandbuySelected = [true, false];

  List<bool> get items => _itemsrentandbuySelected;

  void updateItem(int index, bool value) {
    _itemsrentandbuySelected[index] = value;

    update();
  }
}
