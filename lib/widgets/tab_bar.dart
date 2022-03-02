

import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:flutter/material.dart';

DefaultTabController tabcontroller() {
  return DefaultTabController(
    length: 3,
    child: Container(
      decoration: BoxDecoration(
        color: ColorUtil.kWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      width: getUniqueWidth(230),
      height: getUniqueHeight(32),
      child: TabBar(
        indicator: BoxDecoration(
          color: ColorUtil.kBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: ColorUtil.kWhite,
        unselectedLabelColor: ColorUtil.kBlue,
        tabs: const [
          Tab(
            text: 'About',
          ),
          Tab(
            text: 'Work',
          ),
          Tab(
            text: 'Activity',
          ),
        ],
      ),
    ),
  
  );
}
