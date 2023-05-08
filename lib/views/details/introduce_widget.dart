import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/color.dart';
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
      "The war against Voldemort is not going well, even the Muggles have been affected. Dumbledore is absent from Hogwarts for long stretc hes of time, and the Order of the Phoenix has alread...";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Text(
                "Thời lượng",
                style: CustomText.title(16, Colors.black),
              ),
              trailing: Text(
                "20 tiếng 16 phút",
                style: CustomText.subText(16, Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Số trang",
                style: CustomText.title(16, Colors.black),
              ),
              trailing: Text(
                "200 trang",
                style: CustomText.subText(16, Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Thể loại",
                style: CustomText.title(16, Colors.black),
              ),
              trailing: Text(
                "Tiểu thuyết",
                style: CustomText.subText(16, Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Giới thiệu về cuốn sách",
                    style: CustomText.title(16, Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: introduceBook,
                      style: const TextStyle(
                          fontFamily: 'SVNGilroy',
                          color: colorGrayScaleLabel,
                          fontSize: 13,
                          height: 2,
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 0.25),
                    ),
                    const TextSpan(
                        text: "Xem thêm",
                        style: TextStyle(
                            fontFamily: 'SVNGilroy',
                            color: colorTextRegister,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            height: 2,
                            letterSpacing: 0.75,
                            fontWeight: FontWeight.w700,
                            wordSpacing: 0.25))
                  ])),
                ],
              ),
            ),
            Column(children: [
              const ExpansionInDetailScreen(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  height: 5,
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "Chương 02: Bàn về tâm thế khởi nghiệp",
                    style: CustomText.title(16, colorLabalTextFiled),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  height: 5,
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "Chương 03: Bàn về sự tu dưỡng",
                    style: CustomText.title(16, colorLabalTextFiled),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  height: 5,
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "Chương 04: Bàn về ý thức nguy cấp",
                    style: CustomText.title(16, colorLabalTextFiled),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nội dung tương tự",
                    style: CustomText.title(22, Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
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
                            return ItemAllScreen(
                              books: value.listBooks[index],
                              index: index,
                            );
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
      ),
    );
  }
}
