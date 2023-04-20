import 'package:flutter/cupertino.dart';

class Category extends ChangeNotifier {
  String name;
  String svgPicture;
  bool? selectedIndex;
  int? index = 1;
  void changeColors() {
    selectedIndex = !selectedIndex!;
    notifyListeners();
  }

  Category(
      {required this.name,
      required this.svgPicture,
      this.selectedIndex = false,
      this.index = 0});
}

List<Category> mListCategory = [
  Category(
      name: 'Doanh nhân và doanh nghiệp',
      svgPicture: "images/category/image_business.svg"),
  Category(name: 'Tài chính', svgPicture: "images/category/image_finance.svg"),
  Category(
      name: 'Marketing', svgPicture: "images/category/image_marketing.svg"),
  Category(
      name: 'Phát triển bản thân',
      svgPicture: "images/category/image_improve_myseflt.svg"),
  Category(
      name: 'Gia đình và sức khỏe',
      svgPicture: "images/category/image_heart.svg"),
  Category(
      name: 'Giao tiếp ứng xử', svgPicture: "images/category/image_smile.svg"),
  Category(name: 'Thiết kế', svgPicture: "images/category/image_design.svg"),
  Category(name: 'Văn hóa', svgPicture: "images/category/image_vanhoa.svg"),
  Category(name: 'Lịch sử', svgPicture: "images/category/image_world.svg"),
];
