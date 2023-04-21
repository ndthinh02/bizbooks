import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/custom_button.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/my_home_page.dart';
import 'package:ui_flutter/views/choose_category/choose_category_provider.dart';

import '../../ui/color.dart';
import 'item.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({super.key});

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  ChooseCategoryProvider get categoryChoose =>
      context.watch<ChooseCategoryProvider>();
  ChooseCategoryProvider get readCategoryChoose =>
      context.read<ChooseCategoryProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chọn chủ đề',
                style: CustomText.title(28, Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Hãy chọn ít nhất',
                style: CustomText.title(20, Colors.black),
              ),
              Text(
                '2 chủ đề bạn quan tâm',
                style: CustomText.title(20.0, Colors.black),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: colorBackgroundTextFiled,
                    prefixIcon: const Icon(Icons.search_outlined),
                    hintText: "Tìm kiếm chủ đề",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 50,
              ),
              Consumer<ChooseCategoryProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.mList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemCategory(
                          category: value.mList[index],
                          index: index,
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  colorBorderSide: colorButton,
                  assetImage: '',
                  function: () {
                    if (readCategoryChoose.mlistChoseCategory.length >= 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                    }
                  },
                  title: "Tiếp tục            ",
                  colorButton: categoryChoose.mlistChoseCategory.length >= 2
                      ? colorButton
                      : Colors.grey,
                  radius: BorderRadius.circular(40),
                  sizeText: 20,
                  colorText: Colors.white)
            ],
          ),
        ),
      )),
    );
  }
}
