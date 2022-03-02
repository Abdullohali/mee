


import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/screens/info/info_page.dart';
import 'package:aboumenew/screens/work/work_pagee.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 3.0,
          bottom: TabBar(
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
        body:  TabBarView(
          children: [InfoPage(), WorkPage(), Center()],
        ),
      ),
    );
  }
}
