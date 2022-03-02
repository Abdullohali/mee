

import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:flutter/material.dart';

SelectableText bigText(String txt) {
  return SelectableText(
    txt,
    style: TextStyle(
        color: ColorUtil.kGrey,
        fontSize: getUniqueHeight(10),
        fontWeight: FontWeight.w500),
  );
}

SelectableText smallText(String txt) {
  return SelectableText(txt,
      style: TextStyle(
          color: ColorUtil.kLigtGrey,
          fontSize: getUniqueHeight(9),
          fontWeight: FontWeight.w500));
}

SelectableText veryBigtxt(String txt) {
  return SelectableText(
    txt,
    style: const TextStyle(
        fontSize: 14, color: ColorUtil.kGrey, fontWeight: FontWeight.w600),
    textAlign: TextAlign.start,
  );
}
 SelectableText biggestText(String txt) {
    return SelectableText(
                      txt,
                      style: TextStyle(
                          color: ColorUtil.kGrey,
                          fontSize: getUniqueHeight(35),
                          fontWeight: FontWeight.w500),
                    );
  }
