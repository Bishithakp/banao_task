import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/data_constants.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'programs_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const ProgramsPage(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return ValueListenableBuilder<int>(
        valueListenable: homePageIndexNotifier,
        builder: (context, index, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.blueBackGroundColor,
              scrolledUnderElevation: 0,
              title: appBarIcon('assets/icons/Menu.png'),
              actions: [
                appBarIcon('assets/icons/chat_main.png'),
                const SizedBox(
                  width: 10,
                ),
                appBarIcon('assets/icons/Notification.png'),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            body: pages[index],
            bottomNavigationBar: const CustomBottomNavBar()));
  }

  Image appBarIcon(String imagePath) {
    return Image.asset(
      imagePath,
      width: 30,
      height: 30,
    );
  }
}
