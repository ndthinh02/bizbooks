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
  const ItemCategory({super.key, required this.category, required this.index});

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
        GestureDetector(
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
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: widget.category.selectedIndex == true
                      ? colorLight
                      : Colors.white,
                  radius: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(widget.category.svgPicture),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                  width: 100,
                  child: Text(
                    widget.category.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: widget.category.selectedIndex == true
                        ? const TextStyle(
                            color: colorButton,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SVNGilroy')
                        : CustomText.subText(15, Colors.black),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
