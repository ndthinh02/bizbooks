import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter/ui/color.dart';

import '../../../../../ui/custom_text.dart';

class WasWatching extends StatelessWidget {
  const WasWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351.w,
      height: 216.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Image.asset(
                "images/image_book.png",
                width: 128.w,
                height: 192.h,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                        color: colorSuccess,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Đang xem gần đây",
                        style: CustomText.subTextLigth(15, colorSuccessDark),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      " Barack Obama và sự nghiệp - The Audaci..",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: CustomText.title(17, colorLabalTextFiled),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Brack obama",
                    style: CustomText.subTextLigth(13, Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset("images/progess.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 175,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 2, color: Color(0xff00cc67)),
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF00994D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {},
                        child: Text(
                          "TIẾP TỤC",
                          style: CustomText.title(16, const Color(0xFF00994D)),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
