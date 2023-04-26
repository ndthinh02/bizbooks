import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/home/all/see_more_category/see_more_category_screen.dart';
import 'package:ui_flutter/views/choose_category/choose_category_provider.dart';

class CategoryInAllScreen extends StatelessWidget {
  const CategoryInAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Danh mục",
              style: CustomText.title(21, Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SeemoreCategoryScreen())),
              child: Text(
                "Xem tất cả",
                style: CustomText.subText(15, colorButton),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Consumer<ChooseCategoryProvider>(
          builder: (context, value, child) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = value.mList[index];
                return Container(
                  // color: Colors.amber,
                  child: Row(
                    children: [
                      SvgPicture.asset(item.svgPicture,
                          width: 50, height: 50, fit: BoxFit.scaleDown),
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 110,
                          child: Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomText.title(15, colorLabalTextFiled),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 0.75,
                  crossAxisCount: 2),
            );
          },
        ),
      ],
    );
  }
}
