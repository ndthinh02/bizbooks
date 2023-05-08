import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/models/books.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/views/bottom/search_screen.dart';

import 'item_book_unlock.dart';

class BookUnlockScreen extends StatefulWidget {
  const BookUnlockScreen({super.key});

  @override
  State<BookUnlockScreen> createState() => _BookUnlockScreenState();
}

class _BookUnlockScreenState extends State<BookUnlockScreen> {
  final TextEditingController _seacrhController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: double.infinity.w,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: CustomSearch.customSearch(
                    'Tìm kiếm sách', false, _seacrhController, () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<BookProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.listBooks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemBookUnlock(
                        books: value.listBooks[index],
                        index: index,
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.45,
                            mainAxisSpacing: 60,
                            crossAxisSpacing: 10,
                            crossAxisCount: 3),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
