import 'package:flutter/cupertino.dart';
import 'package:ui_flutter/models/category.dart';
import 'package:ui_flutter/models/category_choose.dart';

class ChooseCategoryProvider extends ChangeNotifier {
  List<Category> mList = mListCategory;
  List<CategoryChoose> mlistChoseCategory = [];
  int index = 0;
  void add(String name) {
    CategoryChoose categoryChoose = CategoryChoose(name: name);
    mlistChoseCategory.add(categoryChoose);
    index++;
    print(mlistChoseCategory);
    notifyListeners();
  }

  void remove() {
    index--;
    mlistChoseCategory.removeAt(index);
    print(mlistChoseCategory);
    notifyListeners();
  }
}
