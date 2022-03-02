
import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/widgets/connection_cont.dart';
import 'package:aboumenew/widgets/img_cont.dart';
import 'package:aboumenew/widgets/text_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);
  final info = FirebaseFirestore.instance.collection('info').snapshots();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: info,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  decoration: BoxDecoration(
                    color: ColorUtil.kWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      imgContainer(false), //THIS IS THE IMAGE CONTAINER
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          biggestText(data.docs[0]['name'].toString() +
                              '\n' +
                              data.docs[0]['surname'].toString()),
                          smallText("Email"),
                          bigText(data.docs[0]['email'].toString()+ "\n"),
                          smallText("Date of Birth"),
                          bigText(data.docs[0]['datebirth'].toString()+ "\n"),
                          smallText("Address"),
                          bigText(data.docs[0]['address'].toString() + "\n"),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  //About me and Bio
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorUtil.kWhite),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SelectableText(
                          "Bio",
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorUtil.kGrey,
                              fontWeight: FontWeight.w600),
                        ),
                        SelectableText(
                          data.docs[0]['bio'].toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: ColorUtil.kGreywhite,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Connection(),
                Container(
                  width: double.maxFinite,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorUtil.kWhite),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          veryBigtxt("Website\n"),
                          veryBigtxt("Phone"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          veryBigtxt("www.myportfolio.com\n"),
                          veryBigtxt("+998" + data.docs[0]['phone'].toString()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
