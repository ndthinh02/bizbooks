import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/models/books.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/views/bottom/home/all/widget/most_listen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _seacrhController = TextEditingController();
  BookProvider get readBook => context.read<BookProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tìm kiếm",
                style: CustomText.title(28, Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: CustomSearch.customSearch(
                    "Tìm kiếm", false, _seacrhController, () {
                  // readBook.seacrh(_seacrhController.text);
                  // print(_seacrhController.text);
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: SingleChildScrollView(child: MostListenWidget()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
