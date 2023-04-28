import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/views/details/detail_book_screen.dart';

import '../../../../../models/books.dart';
import '../../../../../ui/custom_text.dart';

class ItemAllScreen extends StatelessWidget {
  final Books books;
  final int index;
  const ItemAllScreen({super.key, required this.books, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<BookProvider>();
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailBookScreen(
                books: provider.listBooks[index],
              ))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: 110,
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(books.urlImage),
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  width: 110,
                  child: Text(
                    books.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomText.title(15, colorLabalTextFiled),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  books.author,
                  style: CustomText.subTextLigth(15, colorGrayScaleLabel),
                )
              ],
            )),
      ),
    );
  }
}
