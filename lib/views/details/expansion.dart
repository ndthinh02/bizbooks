import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ui/color.dart';
import '../../ui/custom_text.dart';
import 'constain.dart';

class ExpansionInDetailScreen extends StatelessWidget {
  final int index;
  const ExpansionInDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: index == 0
          ? Text(
              "Chương 0${index + 1}: Bàn về kế hoạch cuộc sống",
              style: CustomText.title(15, Colors.black),
            )
          : index == 1
              ? Text(
                  "Chương 0${index + 1}: Bàn về sự tu dưỡng",
                  style: CustomText.title(15, Colors.black),
                )
              : index == 2
                  ? Text(
                      "Chương 0${index + 1}: Bàn về ý thức nguy cấp",
                      style: CustomText.title(15, Colors.black),
                    )
                  : Text(
                      "Chương 0${index + 1}: Bàn về tâm thế nghiệp",
                      style: CustomText.title(15, Colors.black),
                    ),
      children: [
        container(
            SvgPicture.asset("images/icon_arrow_down.svg"),
            "Đoạn 01: Lời mở đầu",
            "Đọc ebook",
            "Nghe audio",
            145.0,
            heightButton,
            130.0,
            true,
            ''),
        container(
            SvgPicture.asset("images/icon_done.svg"),
            "Đoạn 02: Bàn về kế hoạch cuộc đời và cách kiến tạo lên bản đánh giá chất lượng công việc",
            "Đọc ebook",
            "Nghe audio",
            145.0,
            heightButton,
            160.0,
            true,
            ''),
        container(
            const Text(''),
            "Mua ngay sách điện tử mở khóa toàn bộ nội dung sách",
            '',
            "Mua ngay",
            140.0,
            heightButton,
            130.0,
            false,
            'Giá 290.000đ'),
        Container(
          margin: edgeInsets,
          width: width2,
          height: 100,
          decoration: BoxDecoration(
              color: colorGradientPink,
              borderRadius: BorderRadius.circular(12)),
          child: Container(
            margin: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock, color: Colors.red),
                    SizedBox(
                      width: 250,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Đoạn 03: Sản phẩm khiến bạn chưa hoàn thành trong công việc của mình",
                          maxLines: 3,
                          style: CustomText.subText(15, Colors.black),
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
            40.0,
            140.0,
            true,
            ''),
        container(const Text(''), "Ôn luyện kiến thức chương 01", '',
            "Làm bài ngay", 160.0, heightButton, 120.0, false, '0/10 câu')
      ],
    );
  }
}
