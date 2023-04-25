import 'package:flutter/material.dart';

import '../../../ui/custom_text.dart';

class Header extends StatelessWidget {
  final String title;
  final String subTitle;
  const Header({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: CustomText.title(28, Colors.white),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          subTitle,
          style: CustomText.subText(16, Colors.white),
        ),
      ],
    );
  }
}
