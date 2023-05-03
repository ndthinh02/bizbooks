import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/views/choose_category/choose_category_provider.dart';

import '../../models/category.dart';
import '../../ui/color.dart';
import '../../ui/custom_text.dart';

class ItemCategory extends StatefulWidget {
  final Category category;
  final int index;
  final bool check;
  const ItemCategory(
      {super.key,
      required this.category,
      required this.index,
      required this.check});

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  Category get watchCategory => context.watch<Category>();
  Category get readCategory => context.read<Category>();
  ChooseCategoryProvider get readChooseCategoryC =>
      context.read<ChooseCategoryProvider>();
  int indexChooseCategory = 1;
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        widget.check == true
            ? GestureDetector(
                onTap: () {
                  // readCategory.changeColors();
                  // print(widget.index);
                  setState(() {
                    widget.category.changeColors();
                  });
                  if (widget.category.selectedIndex == true) {
                    readChooseCategoryC.add(widget.category.name);
                  } else {
                    readChooseCategoryC.remove();
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.category.selectedIndex == true
                          ? colorGrayScale
                          : colorScafold,
                      radius: 45,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: widget.category.selectedIndex == true
                            ? colorLight
                            : colorScafold,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(widget.category.svgPicture),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: 110,
                        child: Text(
                          widget.category.name,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: widget.category.selectedIndex == true
                              ? CustomText.title(13, colorButton)
                              : CustomText.title(13, colorGrayScalePlaceholder),
                        ))
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: colorScafold,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(widget.category.svgPicture),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: 110,
                        child: Text(
                          widget.category.name,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: CustomText.title(13, colorGrayScaleLabel),
                        ))
                  ],
                ),
              )
      ],
    );
  }
}
