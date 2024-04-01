import 'package:flutter/material.dart';

final ValueNotifier<int> homePageIndexNotifier = ValueNotifier<int>(0);
const String programApi =
    'https://632017e19f82827dcf24a655.mockapi.io/api/programs';
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
const String lessonsApi =
    'https://632017e19f82827dcf24a655.mockapi.io/api/lessons';
