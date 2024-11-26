
import 'package:flutter/material.dart';
import 'package:hello_media/utils/theme/colors.dart';

const primarycolor = Color(0xFFC70000);

const secondarycolor = Color(0xFF1267A8);

class MyTheme {
  static final theme =
      ThemeData(appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: ColorResources.WHITE)),scaffoldBackgroundColor: ColorResources.SCAFFOLDBG);
}
