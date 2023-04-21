import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/books.dart';
import '../../../../../ui/custom_text.dart';
import 'item.dart';

class BookGood extends StatelessWidget {
  const BookGood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Sách hay phải đọc",
          style: CustomText.title(20, Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<BookProvider>(
          builder: (context, value, child) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: value.listBooks.length,
                itemBuilder: (context, index) {
                  return ItemAllScreen(books: value.listBooks[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
