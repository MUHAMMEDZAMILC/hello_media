// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String assetName;
  final Color? color;
  final BoxFit fit;
  final double? width, height;
  final void Function()? onPressed;

  const AppSvg({
    Key? key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.onPressed,
  }) : super(key: key);

  ///Click enabled SVG
  const AppSvg.clickable({
    Key? key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      onPressed == null ? buildSvgPicture : InkWell(onTap: onPressed, child: buildSvgPicture);

  get buildSvgPicture =>
      SvgPicture.asset("assets/images/$assetName.svg", fit: fit, width: width, height: height,color: color,);

}