import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/book_good.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/category.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/most_listen.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/slider.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/sugessted.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/was_watching.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearch.customSearch("Tìm kiếm sách"),
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
