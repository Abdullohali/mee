import 'dart:async';



import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/screens/data/data_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TitleSceen extends StatefulWidget {
  const TitleSceen({Key? key}) : super(key: key);

  @override
  State<TitleSceen> createState() => _TitleSceenState();
}

class _TitleSceenState extends State<TitleSceen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Datapage()));
    });
    // Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtil.kWhite,
        body: Center(
          child: Lottie.asset("assets/json/lottie3.json"),
        ));
  }
}
