import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/models/books.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/item.dart';

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
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomSearch.customSearch(
                  'Tìm kiếm sách', false, _seacrhController, () {}),
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
                      return ItemAllScreen(books: value.listBooks[index]);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.45,
                            mainAxisSpacing: 20,
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
