import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/views/choose_category/choose_category_provider.dart';
import 'package:ui_flutter/views/choose_category/item.dart';

class SeemoreCategoryScreen extends StatefulWidget {
  const SeemoreCategoryScreen({super.key});

  @override
  State<SeemoreCategoryScreen> createState() => _SeemoreCategoryScreenState();
}

class _SeemoreCategoryScreenState extends State<SeemoreCategoryScreen> {
  final TextEditingController _seacrhController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Danh mục",
                  style: CustomText.title(28, Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSearch.customSearch(
                    "Tìm kiếm danh mục", false, _seacrhController, () {}),
                const SizedBox(
                  height: 20,
                ),
                Consumer<ChooseCategoryProvider>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: value.mList.length,
                      itemBuilder: (context, index) {
                        return ItemCategory(
                          category: value.mList[index],
                          index: index,
                          check: false,
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
