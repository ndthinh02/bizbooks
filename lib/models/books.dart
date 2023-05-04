import 'package:flutter/cupertino.dart';

class Books {
  String urlImage;
  String name;
  String author;
  String category;
  double rate;
  int views;
  String urlAudio;
  String id;
  Books(
      {required this.urlImage,
      required this.name,
      required this.author,
      required this.category,
      required this.rate,
      required this.views,
      required this.urlAudio,
      required this.id});
}

List<Books> mListBooks = [
  Books(
    id: '0',
    urlImage: "images/image_book.png",
    category: 'Kinh tế tài chính',
    rate: 4.2,
    views: 1251,
    name: "Can they do that tomorrow",
    author: "John Wick",
    urlAudio:
        'https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20Vietsub%20TikTok%20Ki%C3%AAu%20ng%E1%BA%A1o%20%20en.mp3?alt=media&token=0e329ec0-6bfd-42d0-ad24-0916f315aeb9',
  ),
  Books(
      id: '1',
      urlImage: "images/image_poster1.png",
      name: "Đàn ông sao hỏa đàn bà sao kim",
      author: "Nguyễn Hiển Lê",
      category: "Kinh tế",
      rate: 5,
      views: 1200,
      urlAudio:
          'https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20Vietsub%20%20pinyin%20Kh%C3%B4ng%20bi%E1%BA%BFt%20ph%E1%BA%A3i%20l%C3%A0m%20sao%20%E4%B8%8D%E7%9F%A5%E6%89%80%E6%8E%AA%20%20V%C6%B0%C6%A1ng%20T%C4%A9nh%20V%C4%83n%20Kh%C3%B4ng%20M%E1%BA%ADp%20%E7%8E%8B%E9%9D%96%E9%9B%AF%E4%B8%8D%E8%83%96%20%20TikTok.mp3?alt=media&token=1b754215-6971-449c-8710-8a025d4a226a'),
  Books(
      id: '2',
      urlImage: "images/image_poster2.png",
      name: "Happy City In The World",
      author: "Brack Obama",
      category: "Kinh tế",
      rate: 5,
      views: 1251,
      urlAudio:
          'https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20Dynasty%20Official%20Music%20Video%20%20MIIA.mp3?alt=media&token=dbd02234-e48e-4396-be34-f7e82f4b01dc'),
  Books(
      id: '3',
      urlImage: "images/image_poster3.png",
      name: "Brack Obama và sự nghiệp",
      author: "Brack Obama",
      category: "Kinh tế",
      rate: 5,
      views: 1251,
      urlAudio:
          'https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20vietsub%20%20%C4%90%C3%A2u%20%C4%91%C3%A2u%20c%C5%A9ng%20l%C3%A0%20em%20%20YoungCaptain%20%20%E5%93%AA%E9%87%8C%E9%83%BD%E6%98%AF%E4%BD%A0%20%20%20YoungCaptain.mp3?alt=media&token=b91db9ec-a472-4e29-875b-bcb610462d4c'),
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
