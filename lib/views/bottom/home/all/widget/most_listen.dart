import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/models/books.dart';
import 'package:ui_flutter/ui/custom_text.dart';

import 'item_most_listen.dart';

class MostListenWidget extends StatelessWidget {
  const MostListenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nghe nhiều nhất",
          style: CustomText.title(20, Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<BookProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final items = value.listBooks[index];
                return ItemMostListen(
                  books: items,
                  index: index,
                );
              },
            );
          },
        )
      ],
    );
  }
}
