import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../models/books.dart';
import '../../../../../ui/color.dart';
import '../../../../../ui/custom_text.dart';

class ItemMostListen extends StatelessWidget {
  final int index;
  final Books books;
  const ItemMostListen({super.key, required this.index, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 351,
        height: 230,
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  books.urlImage,
                  width: 128,
                  height: 191,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  "#${index + 1}",
                                  style: CustomText.subText(13, Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              // width: 150,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 35,
                              decoration: BoxDecoration(
                                  color: colorBackgroundTextFiled,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  books.category,
                                  style: CustomText.subTextLigth(
                                      15, colorTextFiled),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 180,
                          child: Text(
                            books.name,
                            style: CustomText.title(17, colorLabalTextFiled),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          books.author,
                          style: CustomText.subTextLigth(15, colorTextAuthor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("images/icon_star.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              books.rate.toString(),
                              style: CustomText.title(17, Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "(${books.views} lượt đọc)",
                              style:
                                  CustomText.subText(15, colorLabalTextFiled),
                            )
                          ],
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    )),
                    SizedBox(
                      width: 175,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2, color: colorButton),
                              backgroundColor: Colors.white,
                              foregroundColor: colorButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          onPressed: () {},
                          child: Text(
                            "XEM SÁCH",
                            style: CustomText.title(15, colorButton),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
