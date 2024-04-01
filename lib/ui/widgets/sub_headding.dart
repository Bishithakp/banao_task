import 'package:flutter/material.dart';

import '../../utils/constants/app_text_style.dart';

class SubHeadings extends StatelessWidget {
  final String label;

  const SubHeadings({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Text(label, style: AppTextStyle.programsTitleTextStyle),
          const Spacer(),
          Text("View all", style: AppTextStyle.appSubTitleTextStyle),
          const SizedBox(
            width: 5,
          ),
          Image.asset(
            "assets/icons/arrow.png",
            width: 13,
          ),
        ],
      ),
    );
  }
}
