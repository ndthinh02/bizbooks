import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/views/audio_player/audio_main_screen.dart';

import '../../ui/color.dart';
import '../../ui/custom_button.dart';
import '../../ui/custom_text.dart';
import 'assess_widget.dart';
import 'introduce_widget.dart';

class DetailBookScreen extends StatefulWidget {
  const DetailBookScreen({super.key});

  @override
  State<DetailBookScreen> createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen>
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
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: SafeArea(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Stack(
                                // alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 700,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            colorFilter: ColorFilter.mode(
                                              const Color(0xFFe8e8e8)
                                                  .withOpacity(0.1),
                                              BlendMode.modulate,
                                            ),
                                            fit: BoxFit.fitHeight,
                                            image: const AssetImage(
                                              "images/image_book.png",
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Icon(
                                                Icons.arrow_back_ios_outlined,
                                                size: 20,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 20),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: ElevatedButton.icon(
                                                      onPressed: () {},
                                                      style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                          backgroundColor:
                                                              colorGreenMedium),
                                                      icon: SvgPicture.asset(
                                                          "images/icon_book.svg"),
                                                      label: Text(
                                                        "Mua sách in",
                                                        style:
                                                            CustomText.subText(
                                                                13,
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SvgPicture.asset(
                                                      "images/icon_cart.svg"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 140, top: 0),
                                                    child: SvgPicture.asset(
                                                        "images/icon_cd.svg")),
                                                Image.asset(
                                                  "images/image_book.png",
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  5,
                                                  (index) => SvgPicture.asset(
                                                      "images/icon_star.svg")),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: 240,
                                              child: Text(
                                                "Little Bad Habits \n Growth Stronger",
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: CustomText.title(
                                                    24, Colors.black),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "Lisa Lutz",
                                              style: CustomText.subText(
                                                  15, colorTextFiled),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            CustomButton(
                                              colorBorderSide: colorButton,
                                              function: () {},
                                              title: "NGHE AUDIO MIỄN PHÍ",
                                              colorButton: colorButton,
                                              radius: 40,
                                              sizeText: 15,
                                              colorText: Colors.white,
                                              icon: const SizedBox(),
                                              marginHorizontal: 20,
                                              marginVertical: 8,
                                              isCheckHaveIcon: false,
                                            ),
                                            CustomButton(
                                              function: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AudioMainScreen()));
                                              },
                                              title: "ĐỌC THỬ",
                                              colorButton: colorTextRegister,
                                              radius: 40,
                                              sizeText: 15,
                                              colorText: Colors.white,
                                              colorBorderSide:
                                                  colorTextRegister,
                                              icon: const SizedBox(),
                                              marginHorizontal: 20,
                                              marginVertical: 8,
                                              isCheckHaveIcon: false,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: TabBar(
                                labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                // labelPadding: const EdgeInsets.only(top: 20),
                                indicator: const UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        color: colorButton, width: 3)),
                                isScrollable: true,
                                labelColor: Colors.black,
                                labelStyle: CustomText.title(20, Colors.black),
                                unselectedLabelColor: colorTextAuthor,
                                unselectedLabelStyle:
                                    CustomText.title(20, colorTextAuthor),
                                controller: _tabController,
                                tabs: const [
                                  Tab(
                                    child: Text("Giới thiệu"),
                                  ),
                                  Tab(
                                    child: Text("Đánh giá"),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: Container(
                color: const Color(0xFFffffff),
                child: SafeArea(
                  child: TabBarView(
                      controller: _tabController,
                      children: const [IntroduceWidget(), AssessWidget()]),
                ),
              ),
            )));
  }
}
