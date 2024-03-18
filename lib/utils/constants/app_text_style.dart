import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle appDefaultSTextStyle = GoogleFonts.lora();

  static TextStyle bottomNavBarTextStyle = GoogleFonts.inter().copyWith(
      fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.appMainColor);
  static TextStyle appTitleTextStyle = AppTextStyle.appDefaultSTextStyle
      .copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.appGreyTextColor);
  static TextStyle appSubTitleTextStyle = GoogleFonts.inter().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.appLightGreyTextColor);
  static TextStyle homePageOptionsTextStyle = GoogleFonts.inter().copyWith(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appMainColor);
  static TextStyle programsTitleTextStyle = AppTextStyle.appDefaultSTextStyle
      .copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor);
  static TextStyle homePageCardTitleTextStyle = GoogleFonts.inter().copyWith(
      fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.appMainColor);
  static TextStyle homePageCardSubTitleTextStyle = GoogleFonts.inter().copyWith(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.blackColor);
}
