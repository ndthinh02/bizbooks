import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';

import '../../../../../ui/custom_text.dart';

class WasWatching extends StatelessWidget {
  const WasWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351,
      height: 216,
      decoration: BoxDecoration(
          color: colorBackgroundTextFiled,
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "images/image_book.png",
              width: 128,
              height: 191,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
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
                      style: CustomText.title(17, Colors.black),
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
                                width: 1, color: colorSuccessDark),
                            backgroundColor: Colors.white,
                            foregroundColor: colorSuccessDark,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {},
                        child: Text(
                          "TIẾP TỤC",
                          style: CustomText.title(15, colorSuccessDark),
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
