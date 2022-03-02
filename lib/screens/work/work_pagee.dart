
import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/widgets/get_wrap.dart';
import 'package:aboumenew/widgets/img_cont.dart';
import 'package:aboumenew/widgets/text_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  WorkPage({Key? key}) : super(key: key);
  final personal =
      FirebaseFirestore.instance.collection('personal').snapshots();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: personal,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.requireData;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: ColorUtil.kWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        biggestText(data.docs[0]['specialization'].toString() +
                            "\n" +
                            "Engineer"),
                        smallText("Type"),
                        bigText(data.docs[0]['type'].toString() + "\n"),
                        smallText("Joined"),
                        bigText(data.docs[0]['joined'].toString() + "\n"),
                        smallText("Employeer"),
                        bigText(data.docs[0]['Employeer'].toString()),
                      ],
                    ),
                    imgContainer(true), //THIS IS THE IMAGE CONTAINER
                  ],
                ),
              ),
              GetWrap(),
            ],
          );
        },
      )),
    );
  }
}
