import 'package:bayut_clone_app/constants/list_constants.dart';
import 'package:get/get.dart';

class ListItemController extends GetxController {
  //FURNISHED
  var selectedFurnishedStateIndex = RxInt(-1);
  List<String> Furnishedlist = FURNISHINGSTATE;

  void setFurnishedStateIndex(int index) {
    selectedFurnishedStateIndex.value = index;
    update();
  }

  // BEDROOM

  var selectedbedroomIndex = RxInt(-1);
  List<String> BedroomList = BEDSOPTION;

  void setBedRoomListIndex(int index) {
    selectedbedroomIndex.value = index;
    update();
  }

  // BATHROOMS

  var selectedbathrommIndex = RxInt(-1);
  List<String> BathroomList = BATHROOMOPTIONS;

  void setBathroomListIndex(int index) {
    selectedbathrommIndex.value = index;
    update();
  }

  //CONTRUCTION STATE

  var selectedCSIndex = RxInt(-1);
  List<String> CSList = CONSTRUCTIONSTATE;

  void setCSListIndex(int index) {
    selectedCSIndex.value = index;
    update();
  }

  // PROPERTY TYPE

  var selectedPropertyIndex = RxInt(-1);
  List<String> PropertyTypeList = PROPERTYTYPESUBLIST;

  void setPropertySubTypeListIndex(int index) {
    selectedPropertyIndex.value = index;
    update();
  }

  void deslectPropertyTypeItems() {
    selectedPropertyIndex = RxInt(-1);
    update();
  }

  //Floor level
  var selectedfloorlevel = RxInt(-1);
  List<String> floorLevelList = FLOORLEVEL_LIST;

  void setFloorLevel(int index) {
    selectedfloorlevel.value = index;
    update();
  }

  //cOMMERCIAL TYPE
  var selectedCommercialtype = RxInt(-1);
  List<String> commercialTypeList = COMMERCIAL_TYPE_LIST;

  void setCommercialTypeList(int index) {
    selectedCommercialtype.value = index;
    update();
  }

  //ROOM  TYPE
  var selectedRoomType = RxInt(-1);
  List<String> roomTypeList = ROOM_TYPE_LIST;

  void setRoomType(int index) {
    selectedRoomType.value = index;
    update();
  }
}
