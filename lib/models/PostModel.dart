class PostModel {
  String category;
  String subcategory;
  double price;
  String type;
  String features;
  String areaUnit;
  double area;
  String title;
  String description;
  List<String> imageUrls;
  String userId;

  PostModel(
      {required this.category,
      required this.subcategory,
      required this.price,
      required this.type,
      required this.features,
      required this.areaUnit,
      required this.area,
      required this.title,
      required this.description,
      required this.imageUrls,
      required this.userId});
}
