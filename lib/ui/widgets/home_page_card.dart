import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_style.dart';

class HomePageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String detailsText;
  final bool showBookOption;
  final bool showLockOption;

  const HomePageCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.detailsText,
      this.showBookOption = false,
      this.showLockOption = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.only(right: 10, left: 2, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyBoxShadowColor,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.homePageCardTitleTextStyle,
                ),
                buildSizedBox(),
                Text(
                  subTitle,
                  style: AppTextStyle.homePageCardSubTitleTextStyle,
                ),
                buildSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      detailsText,
                      style: AppTextStyle.appSubTitleTextStyle,
                    ),
                    const Spacer(),
                    bookButton(),
                    lockIcon()
                  ],
                ),
                buildSizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() {
    return const SizedBox(
                height: 12,
              );
  }

  Visibility lockIcon() {
    return Visibility(
                    visible: showLockOption,
                    child: Image.asset(
                      "assets/icons/lock-1.png",
                      width: 20,
                    ),
                  );
  }

  Visibility bookButton() {
    return Visibility(
                    visible: showBookOption,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.appMainColor)),
                      child: Text(
                        "Book",
                        style: AppTextStyle.homePageOptionsTextStyle.copyWith(
                          fontSize: 12
                        ),
                      ),
                    ),
                  );
  }
}
