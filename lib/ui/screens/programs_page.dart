import 'package:bana0_task/view_model/lessons_controller.dart';
import 'package:bana0_task/view_model/program_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_style.dart';
import '../widgets/app_loading.dart';
import '../widgets/home_page_card.dart';
import '../widgets/sub_headding.dart';

class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.blueBackGroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, Priya!", style: AppTextStyle.appTitleTextStyle),
              Text("What do you wanna learn today?",
                  style: AppTextStyle.appSubTitleTextStyle),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    customButton(
                        'assets/icons/Book-mark-2.png', 'Programs', context),
                    customButton(
                        'assets/icons/help-circle-1.png', 'Get help', context),
                    customButton(
                        'assets/icons/open_book.png', 'Learn', context),
                    customButton(
                        'assets/icons/trello-1.png', 'DD Tracker', context),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubHeadings(
                label: "Programs for you",
              ),
              Consumer<ProgramController>(
                  builder: (_, mod, __) => mod.loading
                      ? const Apploading()
                      : mod.userError.code != 0
                          ? Text(mod.userError.message)
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var item in mod.programsList)
                                    HomePageCard(
                                      imagePath: "assets/images/yoga.png",
                                      title: item.category,
                                      subTitle: item.name,
                                      detailsText: '${item.lesson}lessons',
                                    )
                                ],
                              ),
                            )),
              const SubHeadings(
                label: "Events and experiences",
              ),
              const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    HomePageCard(
                      imagePath: "assets/images/exercise.png",
                      title: "BABYCARE",
                      detailsText: "13 Feb, Sunday",
                      subTitle: "Understanding of human behaviour",
                      showBookOption: true,
                    ),
                    HomePageCard(
                      imagePath: "assets/images/exercise.png",
                      title: "Lifestyle",
                      detailsText: "13 Feb, Sunday",
                      subTitle: "A complete guide for your new born baby",
                      showBookOption: true,
                    ),
                  ])),
              const SubHeadings(
                label: "Programs for you",
              ),
              Consumer<LessonsController>(
                  builder: (_, mod, __) => mod.loading
                      ? const Apploading()
                      : mod.userError.code != 0
                          ? Text(mod.userError.message)
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var item in mod.lessonList)
                                    HomePageCard(
                                        imagePath: "assets/images/exercise.png",
                                        title: item.category,
                                        subTitle: item.name,
                                        subTitleHeight: 65,
                                        detailsText:
                                            '${((item.duration) / 60).toStringAsFixed(2)}min')
                                ],
                              ),
                            )
                  //
                  ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget customButton(String imagePath, String label, BuildContext context) {
  double widthRatio = MediaQuery.of(context).size.width / 100;
  return Container(
    width: MediaQuery.of(context).size.width / 2 - 32,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: widthRatio * 3.5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.appMainColor)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 24),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              label,
              style: AppTextStyle.homePageOptionsTextStyle,
            ),
          ),
        ],
      ),
    ),
  );
}
