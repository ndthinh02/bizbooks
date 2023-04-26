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
    return Scaffold(
      backgroundColor: colorScafold,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            height: 157,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                              style: CustomText.subText(13, colorTextFiled),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorLight,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              child: Text(
                                "THAY ĐỔI MỤC TIÊU",
                                style: CustomText.subText(13, colorTextFiled),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '17/20',
                            style: CustomText.title(18, Colors.black),
                          ),
                          const SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              semanticsLabel: "10",
                              strokeWidth: 10,
                              color: colorButton,
                              backgroundColor: Colors.amber,
                              value: 0.7,
                            ),
                          ),
                        ],
                      )
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
      ),
    );
  }
}
