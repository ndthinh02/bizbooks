import 'package:flutter/cupertino.dart';

class Books {
  String urlImage;
  String name;
  String author;
  String category;
  double rate;
  int views;
  Books(
      {required this.urlImage,
      required this.name,
      required this.author,
      required this.category,
      required this.rate,
      required this.views});
}

List<Books> mListBooks = [
  Books(
    urlImage: "images/image_book.png",
    category: 'Kinh tế tài chính',
    rate: 4.2,
    views: 1251,
    name: "Can they do that tomorrow",
    author: "John Wick",
  ),
  Books(
      urlImage: "images/image_poster1.png",
      name: "Đàn ông sao hỏa đàn bà sao kim",
      author: "Nguyễn Hiển Lê",
      category: "Kinh tế",
      rate: 5,
      views: 1200),

  Books(
      urlImage: "images/image_poster2.png",
      name: "Happy City In The World",
      author: "Brack Obama",
      category: "Kinh tế",
      rate: 5,
      views: 1251),
  Books(
      urlImage: "images/image_poster3.png",
      name: "Brack Obama và sự nghiệp",
      author: "Brack Obama",
      category: "Kinh tế",
      rate: 5,
      views: 1251),
  // Books(
  //     urlImage: "images/image_poster4.png",
  //     name: "Happy City",
  //     author: "Brack Obama",
  //     category: "Kinh tế",
  //     rate: 5,
  //     views: 1251),
  // Books(
  //     urlImage: "images/image_poster5.png",
  //     name: "Happy City",
  //     author: "Brack Obama",
  //     category: "Kinh tế",
  //     rate: 5,
  //     views: 1251),
  // Books(
  //     urlImage: "images/image_poster6.png",
  //     name: "Happy City",
  //     author: "Brack Obama",
  //     category: "Kinh tế",
  //     rate: 5,
  //     views: 1251),
];

class BookProvider extends ChangeNotifier {
  List<Books> _mList = mListBooks;
  List<Books> get listBooks => _mList;

  void seacrh(String value) {
    List<Books> listBooks = [];
    if (value.isEmpty) {
      _mList = listBooks;
    } else {
      _mList = _mList.where((element) => element.name.contains(value)).toList();
    }
    print(_mList);
    notifyListeners();
  }
}
