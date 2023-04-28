import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class AssessWidget extends StatefulWidget {
  const AssessWidget({super.key});

  @override
  State<AssessWidget> createState() => _AssessWidgetState();
}

class _AssessWidgetState extends State<AssessWidget> {
  bool clickStar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                height: 380,
                decoration: BoxDecoration(
                    border: Border.all(color: colorGrayScale, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 200,
                        child: Text(
                          "Hãy để lại cảm nhận của bạn về cuốn sách này nhé",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: CustomText.title(20, Colors.black),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 200,
                        child: Text(
                          "Đánh giá sẽ giúp chúng tôi cải thiện sản phẩm",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: CustomText.subTextLigth(16, Colors.black),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    RatingBar.builder(
                        allowHalfRating: false,
                        initialRating: 3,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return SvgPicture.asset("images/icon_star.svg");
                        },
                        onRatingUpdate: (value) {
                          print(value);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 303,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorGrayScale,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Hãy viết cảm nhận về cuốn sách...",
                                hintStyle: CustomText.subText(12, Colors.grey),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon:
                                    SvgPicture.asset("images/icon_camera.svg"),
                                label: Text(
                                  "Thêm ảnh",
                                  style:
                                      CustomText.subText(13, colorTextRegister),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                    side: BorderSide.none),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 20, bottom: 14),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "images/icon_arrow_right.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                'Đánh giá từ người đọc',
                style: CustomText.titleLetter(16, Colors.black, 0.25),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 343,
              decoration: BoxDecoration(
                  color: colorGrayScale,
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                  trailing: Text(
                    "19 March 2023",
                    style: CustomText.subText(13, Colors.black),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Messiu",
                        style: CustomText.titleLetter(16, Colors.black, 0.25),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "images/icon_star.svg",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text(
                            "5.0",
                            style: CustomText.subTextLigth(
                                15, colorGrayScaleLabel),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "That is wonderfull book ! :D ",
                        style: CustomText.titleLetter(
                            12, colorGrayScaleBOdy, 0.25),
                      ),
                    ],
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://th.bing.com/th/id/R.9b6a8aac42752987f786598c4008adcb?rik=3d055kyK7uoUcg&pid=ImgRaw&r=0"),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
