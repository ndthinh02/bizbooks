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
      urlImage: "images/image_book.png",
      category: 'Kinh tế tài chính',
      rate: 4.2,
      views: 1251,
      name: "Đàn ông sao hỏa đàn bà sao kim",
      author: "Nguyễn Hiền Lê"),
  Books(
      urlImage: "images/image_book.png",
      category: 'Kinh tế tài chính',
      rate: 4.6,
      views: 1251,
      name: "Can they do that tomorrow",
      author: "John Wick"),
  Books(
      urlImage: "images/image_book.png",
      category: 'Kinh tế tài chính',
      rate: 4,
      views: 1251,
      name: "Can they do that tomorrow",
      author: "John Wick"),
  Books(
      urlImage: "images/image_book.png",
      category: 'Kinh tế tài chính',
      rate: 5,
      views: 1251,
      name: "Can they do that tomorrow",
      author: "John Wick"),
  Books(
      urlImage: "images/image_book.png",
      category: 'Kinh tế tài chính',
      rate: 5,
      views: 1251,
      name: "Can they do that tomorrow",
      author: "John Wick"),
];

class BookProvider extends ChangeNotifier {
  final List<Books> _mList = mListBooks;
  List<Books> get listBooks => _mList;
}
