import 'package:flutter/material.dart';

import '../../../../../models/books.dart';
import '../../../../../ui/custom_text.dart';

class ItemAllScreen extends StatelessWidget {
  final Books books;
  const ItemAllScreen({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 150,
          height: 191,
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
                  style: CustomText.subText(15, Colors.black),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                books.author,
                style: CustomText.subTextLigth(15, Colors.black),
              )
            ],
          )),
    );
  }
}
