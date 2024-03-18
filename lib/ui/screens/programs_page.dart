import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_style.dart';
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
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          color: AppColors.whiteColor,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeadings(
                label: "Programs for you",
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    HomePageCard(
                      imagePath: "assets/images/yoga.png",
                      title: "Lifestyle",
                      detailsText: "16 lessons",
                      subTitle: "A complete guide for your new born baby",
                    ),
                    HomePageCard(
                      imagePath: "assets/images/yoga.png",
                      title: "Working Part",
                      detailsText: "12 lessons",
                      subTitle: "Understand Behaviour That Challenges",
                    ),
                  ])),
              SubHeadings(
                label: "Events and experiences",
              ),
              SingleChildScrollView(
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
              SubHeadings(
                label: "Programs for you",
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    HomePageCard(
                      imagePath: "assets/images/exercise.png",
                      title: "BABYCARE",
                      detailsText: "3 min",
                      subTitle: "Understanding of human behaviour",
                      showLockOption: true,
                    ),
                    HomePageCard(
                      imagePath: "assets/images/exercise.png",
                      title: "Lifestyle",
                      detailsText: "1 min",
                      subTitle: "A complete guide for your new born baby",
                      showLockOption: true,
                    ),
                  ])),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget customButton(String imagePath, String label, BuildContext context) {
    double widthRatio=MediaQuery.of(context).size.width/100;
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      padding:  EdgeInsets.symmetric(vertical: 10, horizontal: widthRatio*3.5),
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
}




