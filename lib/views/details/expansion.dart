import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ui/color.dart';
import '../../ui/custom_text.dart';
import 'constain.dart';

class ExpansionInDetailScreen extends StatelessWidget {
  const ExpansionInDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            "Chương 01: Bàn về kế hoạch cuộc sống",
            style: CustomText.title(16, colorLabalTextFiled),
          ),
          children: [
            container(
                SvgPicture.asset(
                  "images/icon_download.svg",
                ),
                "Đoạn 01: Lời mở đầu",
                "Đọc ebook",
                "Nghe audio",
                150,
                45.0,
                130.0,
                true,
                ''),
            container(
                SvgPicture.asset("images/icon_done.svg"),
                "Đoạn 02: Bàn về kế hoạch cuộc đời và cách kiến tạo lên bản đánh giá chất lượng công việc",
                "Đọc ebook",
                "Nghe audio",
                150,
                45.0,
                160.0,
                true,
                ''),
            Container(
                width: width2,
                height: 140,
                margin: edgeInsets,
                decoration: BoxDecoration(
                  color: colorGradientPink,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 240,
                            child: Text(
                              "Mua ngay sách điện tử mở khóa toàn bộ nội dung sách",
                              maxLines: 3,
                              style: CustomText.title(15, Colors.black),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: Text(
                              'Giá 299.00đ',
                              style: CustomText.title(15, colorGreenMedium),
                            ),
                          ),
                          SizedBox(
                              height: 45.0,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(24))),
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "images/icon_cart.svg",
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "MUA NGAY",
                                    style: CustomText.titleLetter(
                                        15, Colors.white, 0.25),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              margin: edgeInsets,
              width: width2,
              height: 100,
              decoration: boxDecoration,
              child: Container(
                margin: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("images/icon_lock.svg",
                            color: Colors.red),
                        SizedBox(
                          width: 250,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text(
                              "Đoạn 03: Sản phẩm khiến bạn chưa hoàn thành trong công việc của mình",
                              maxLines: 3,
                              style: TextStyle(
                                  fontFamily: 'SVNGilroy',
                                  fontSize: 15,
                                  color: colorTextAuthor,
                                  letterSpacing: 0.75,
                                  height: 1.2,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            container(
                const CircularProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey,
                  color: colorTextRegister,
                ),
                "Tổng kết chương 1",
                "Đọc ebook",
                "Nghe miễn phí",
                160.0,
                45.0,
                140.0,
                true,
                ''),
            container(const Text(''), "Ôn luyện kiến thức chương 01", '',
                "Làm bài ngay", 160.0, 45.0, 120.0, false, '0/10 câu')
          ],
        ));
  }
}
