
import 'package:flutter/material.dart';
import 'package:hello_media/utils/theme/colors.dart';

const primarycolor = Color(0xFFC70000);

const secondarycolor = ColorResources.SCAFFOLDBG;

class MyTheme {
  static final theme =
      ThemeData(appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: ColorResources.WHITE),backgroundColor: ColorResources.APPBARBG,surfaceTintColor: ColorResources.APPBARBG),scaffoldBackgroundColor: ColorResources.SCAFFOLDBG,);
}
