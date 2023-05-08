import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/home/lib/tab_bar/item_book_unlock.dart';

import '../../../../models/books.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScafold,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 140,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/image_gift.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        height: 140,
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Mã quà tặng',
                                style: CustomText.title(17, Colors.black),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                'Mở khóa sách để nhận quà tặng',
                                style:
                                    CustomText.subText(12, colorGrayScaleLabel),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 45,
                                width: 200,
                                child: TextField(
                                  decoration: InputDecoration(
                                      suffixIcon:
                                          Image.asset("images/image_arrow.png"),
                                      hintText: "Nhập mã quà tặng",
                                      hintStyle: CustomText.subTextLigth(
                                          13, colorGrayScaleLabel),
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: colorGrayScaleLabel),
                                          borderRadius:
                                              BorderRadius.circular(8.32))),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<BookProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.listBooks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemBookUnlock(
                        books: value.listBooks[index],
                        index: index,
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.45,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                            crossAxisCount: 3),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
