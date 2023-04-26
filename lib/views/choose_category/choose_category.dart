import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: colorScafold,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
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
              style: CustomText.title(24, Colors.black),
            ),
            Text(
              '2 chủ đề bạn quan tâm',
              style: CustomText.title(24, Colors.black),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: colorBackgroundTextFiled,
                    prefixIcon: SvgPicture.asset(
                      "images/icon_search.svg",
                      width: 10,
                      height: 10,
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: "Tìm kiếm chủ đề",
                    hintStyle: CustomText.subText(17, colorTextFiled),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                                check: true,
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.9,
                              mainAxisSpacing: 0.5,
                              crossAxisSpacing: 1,
                            ));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              colorBorderSide: categoryChoose.mlistChoseCategory.length >= 2
                  ? colorButton
                  : colorToggle,
              function: () {
                if (readCategoryChoose.mlistChoseCategory.length >= 2) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                }
              },
              title: "Tiếp tục ",
              colorButton: categoryChoose.mlistChoseCategory.length >= 2
                  ? colorButton
                  : colorToggle,
              radius: 40,
              sizeText: 20,
              colorText: Colors.white,
              icon: const SizedBox(),
              marginHorizontal: 50,
              marginVertical: 8,
              isCheckHaveIcon: false,
            )
          ],
        ),
      )),
    );
  }
}
