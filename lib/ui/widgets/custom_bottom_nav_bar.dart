import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_style.dart';
import '../../utils/constants/data_constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageIndexNotifier,
        builder: (context, index, child) => BottomNavigationBar(
              currentIndex: index,
              iconSize: 20,
              backgroundColor: AppColors.whiteColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.appMainColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: AppTextStyle.bottomNavBarTextStyle,
              unselectedLabelStyle: AppTextStyle.bottomNavBarTextStyle
                  .copyWith(color: AppColors.greyBottomNavBarColor),
              onTap: (index) {
                homePageIndexNotifier.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: buildAssetImage("home.png"),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: buildAssetImage("learn.png"),
                  label: 'Learn',
                ),
                BottomNavigationBarItem(
                  icon: buildAssetImage('hub.png'),
                  label: 'Hub',
                ),
                BottomNavigationBarItem(
                  icon: buildAssetImage('chat.png'),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: buildAssetImage('profile.png'),
                  label: 'Profile',
                ),
              ],
            ));
  }

  Image buildAssetImage(String image) {
    return Image.asset(
      'assets/icons/$image',
      width: 14,
      height: 16,
    );
  }
}
