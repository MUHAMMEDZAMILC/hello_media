// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';



class ColorResources {
  static const Color SCAFFOLDBGOLD = Color(0xffF7F8FD);
  static const Color SCAFFOLDBG = Color(0xFF171717);
  static const Color HINTTEXT = Color(0xFFBDBDBD);
  static const Color PRIMARY = Color(0xff141e3c);
  static const Color GREY1 = Color(0xff777aae);
  static const Color SECONDARY = Color(0xffff1b6f);
  static const Color BLACK = Color(0xff0d0005);
  static const Color GREY2 = Color(0xffbcbedb);
  static const Color GREY3 = Color(0xffd9dae4);
  static const Color GREY4 = Color(0xfff2f2f2);
  static const Color GREY5 = Color(0xfff6f6f6);
  static const Color grey6 = Color(0xffd9d9d9);
  // static const Color GREY7 = Color(0xffd9d9d9);
  static const Color tabBarGrey = Color(0xFFD9D9D9);
  static const Color chatblue = Color(0xffccf1f6);

  static const Color GREEN = Color(0xff1cc02d);
  static const Color RED = Color(0xffff1e1e);
  static const Color YELLOW = Color(0xffefba00);
  static const Color WHITE = Colors.white;
  static const Color BLACKGREY = Color(0xff686868);
  static const Color TRANSPARENT = Colors.transparent;

//to remove

  static const Color BORDER = GREY2;
  //Color(0xFFE7E7E7);
  static const Color PLACEHOLDER = Color.fromARGB(255, 28, 16, 16);
  static const Color TEXT1 = Color(0xFF2F4858);
  static const Color TEXT2 = Color(0xFF334B77);
  static const Color AMTGREEN = Color(0xFF00B512);

  static const Color cardrejectColor = Color(0xffffd2d2);
  static const Color cardRecivedColor = Color(0xffd2f2d5);

  static const Color GREY = Color(0xFF939393);
  // static const Color WHITE = Colors.white;

  static const Color BORDER_SHADE = Color(0xFFF6F6F6);

  static const Color BLUE = Color(0xFF0348CF);
  static const Color CHART_BOOKING = Color(0xFF52ABFD);
  static const Color CHART_REVENUE = Color(0xFF1BC9CD);
  static const Color LAVENDER = Color(0xFF703EC2);

  static const Color CHART_HOLD = Color(0xFFFFBD5A);
  static const Color CHART_CANCEL = Color(0xFFDB0000);
  static const Color ICON_GREY = Color(0xFF9ca4a7);
  static const Color SKYBLUECON = Color(0xFF80b6ca);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.isEmpty) {
      return const Color(0xFF252525);
    } else {
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
  }

  static BoxShadow optionsShadow = const BoxShadow(
    // blurRadius: 10,
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(0, 4),
    spreadRadius: 10,
  );

  static LinearGradient npGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF652D92),
      Color(0xFF2E3192),
      Color(0xFF2353A8),
      Color(0xFF0D95D5),
    ],
    stops: [0, 0.31, 0.67, 0.93],
  );

  static LinearGradient vediothumbnailGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.black.withOpacity(0),
      Colors.black.withOpacity(30.38),
      Colors.black.withOpacity(100),
    ],
    stops: const [0.31, 0.67, 0.93],
  );

  static LinearGradient brandGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xfff49b1a),
      Color(0xffff7b39),
      Color(0xffff4e52),
      Color(0xfff80080),
      Color(0xffac018b),
      Color(0xff810090),
    ],
    // stops: [0, 0.31, 0.67, 0.93],
  );
  static LinearGradient splashgradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffff1b6f), Color(0xffff5c4a), Color(0xff141e3c)],
    // stops: [0, 0.31, 0.67, 0.93],
  );

  // colors: [Color(0xffff1b6f), Color(0xffff5c4a), Color(0xff141e3c)],
  static LinearGradient mainGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
     primarycolor,secondarycolor
      // Color(0x00141e3c),
    ],
    // stops: [10, 12, 5, 8],
  );

// LinearGradient(
//               colors: [Colors.blue, Colors.purple],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
  static final ThemeData datePickerTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: PRIMARY,
      brightness: Brightness.light,
      onPrimary: WHITE,
      surface: WHITE,
      onSurface: BLACK,
      secondary: PRIMARY,
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
     
    ),
  );

  static List<BoxShadow> defshadow =  [
                                    BoxShadow(
                                        color: ColorResources.BLACKGREY
                                            .withOpacity(0.3),
                                        blurRadius: paddingSmall)
                                  ];
}
