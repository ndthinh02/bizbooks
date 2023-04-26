import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/book_good.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/category.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/most_listen.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/slider.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/sugessted.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/was_watching.dart';
import 'package:ui_flutter/views/bottom/search_screen.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final TextEditingController _seacrhController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorScafold,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  decoration: BoxDecoration(
                      color: colorBackgroundTextFiled,
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    leading: SvgPicture.asset("images/icon_search.svg"),
                    title: Text(
                      "Tìm kiếm sách",
                      style: CustomText.subText(17, colorTextFiled),
                    ),
                    trailing: const Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                  ),
                )),
            const SizedBox(height: 30),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Suggested(),
                    WasWatching(),
                    BookGood(),
                    SizedBox(
                      height: 30,
                    ),
                    CategoryInAllScreen(),
                    SizedBox(
                      height: 20,
                    ),
                    MostListenWidget(),
                    SliderWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
