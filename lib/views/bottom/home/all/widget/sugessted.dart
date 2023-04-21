import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:ui_flutter/views/bottom/home/all/item.dart';

import '../../../../../models/books.dart';
// import '../../../../models/books.dart'
import '../../../../../ui/custom_text.dart';
import 'item.dart';

class Suggested extends StatelessWidget {
  const Suggested({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gợi ý cho bạn', style: CustomText.title(21, Colors.black)),
        const SizedBox(
          height: 14,
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
