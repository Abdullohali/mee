
import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:flutter/material.dart';

Container imgContainer(bool isTrue) {
  return Container(
    margin: isTrue ? EdgeInsets.fromLTRB(30, 10, 0, 0) : EdgeInsets.all(10),
    height: getUniqueHeight(230),
    width: getUniqueWidth(140),
    decoration: BoxDecoration(
      color: ColorUtil.kWhite,
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
          image: AssetImage(
              "assets/images/me6.png"),
          fit: BoxFit.cover),
    ),
  );
}
