import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/item.dart';
import 'package:ui_flutter/views/details/expansion.dart';

import '../../models/books.dart';

class IntroduceWidget extends StatefulWidget {
  const IntroduceWidget({super.key});

  @override
  State<IntroduceWidget> createState() => _IntroduceWidgetState();
}

class _IntroduceWidgetState extends State<IntroduceWidget> {
  String introduceBook =
      "The war against Voldemort is not going well, even the Muggles have been affected. Dumbledore is absent from Hogwarts for long stretc hes of time, and the Order of the Phoenix has alread.. Xem thêm";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Text(
              "Thời lượng",
              style: CustomText.title(15, Colors.black),
            ),
            trailing: Text(
              "20 tiếng 15 phút",
              style: CustomText.subText(15, Colors.black),
            ),
          ),
          ListTile(
            leading: Text(
              "Số lượng",
              style: CustomText.title(15, Colors.black),
            ),
            trailing: Text(
              "200 trang",
              style: CustomText.subText(15, Colors.black),
            ),
          ),
          ListTile(
            leading: Text(
              "Thể loại",
              style: CustomText.title(15, Colors.black),
            ),
            trailing: Text(
              "Tiểu thuyết",
              style: CustomText.subText(15, Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Giới thiệu về cuốn sách",
                  style: CustomText.title(15, Colors.black),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  introduceBook,
                  style: CustomText.subText(13, Colors.black),
                ),
                Column(
                  children: List.generate(
                      4,
                      (index) => ExpansionInDetailScreen(
                            index: index,
                          )),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nội dung tương tự",
                  style: CustomText.title(20, Colors.black),
                ),
                Consumer<BookProvider>(
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listBooks.length,
                        itemBuilder: (context, index) {
                          return ItemAllScreen(books: value.listBooks[index]);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
