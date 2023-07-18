// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

class HousePostModel {
  String category;
  String subcategory;
  double price;
  String furnishedState;
  int bedRoomNumber;
  int bathRoomNumber;
  String constructionState;
  String features;
  String areaUnit;
  double area;
  String title;
  String description;
  List<String> imageUrls;
  String userId;
  HousePostModel({
    required this.category,
    required this.subcategory,
    required this.price,
    required this.furnishedState,
    required this.bedRoomNumber,
    required this.bathRoomNumber,
    required this.constructionState,
    required this.features,
    required this.areaUnit,
    required this.area,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.userId,
  });
}
