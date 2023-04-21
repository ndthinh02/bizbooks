import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({super.key});

  @override
  State<GiftScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: colorBackgroundTextFiled,
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
                    color: colorBackgroundTextFiled,
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
                            style: CustomText.subText(11, Colors.black),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                  suffixIcon:
                                      Image.asset("images/image_arrow.png"),
                                  hintText: "Nhập mã quà tặng",
                                  hintStyle:
                                      CustomText.subTextLigth(13, Colors.black),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
        ],
      ),
    );
  }
}
