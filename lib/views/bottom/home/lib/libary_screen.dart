import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/home/lib/tab_bar/book_unlock.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          height: 157,
          decoration: BoxDecoration(
              color: colorBackgroundTextFiled,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mục tiêu đọc sách",
                          style: CustomText.title(17, Colors.black),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Trang sách đã đọc trong hôm nay",
                            maxLines: 2,
                            style: CustomText.subText(13, Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          child: Text(
                            "Thay đổi mục tiêu",
                            style: CustomText.subText(13, Colors.grey),
                          ),
                        )
                      ],
                    ),
                    const CircularProgressIndicator(
                      color: colorButton,
                      value: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 45,
                decoration: BoxDecoration(
                  color: colorBackgroundTextFiled,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TabBar(
                    controller: _tabController,
                    labelStyle: CustomText.subText(16, Colors.black),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      color: Colors.white,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Sách đã mở khóa',
                      ),
                      Tab(
                        text: 'Sách quan tâm',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child:
                      TabBarView(controller: _tabController, children: const [
                BookUnlockScreen(),
                Text('data'),
              ]))
            ],
          ),
        ),
      ],
    );
  }
}
