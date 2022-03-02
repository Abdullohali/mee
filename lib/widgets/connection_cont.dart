
import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/isvg_icons.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/widgets/svg_icons.dart';
import 'package:aboumenew/widgets/text_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'launch_url.dart';

class Connection extends StatelessWidget {
  Connection({Key? key}) : super(key: key);
  final webAccount =
      FirebaseFirestore.instance.collection('webAccount').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: webAccount,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.requireData.docs[0];
          return Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorUtil.kWhite),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                veryBigtxt("On the web\n"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: getUniqueWidth(500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: svgAsset(
                            Svgicons.twitter,
                          ),
                          onTap: () async {
                            var url = data['Twitter'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(
                            Svgicons.linkedin,
                          ),
                          onTap: () async {
                            var url = data['Linkedin'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(
                            Svgicons.youtube,
                          ),
                          onTap: () async {
                            var url = data['Youtube'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(
                            Svgicons.telegram,
                          ),
                          onTap: () async {
                            var url = data['Telegram'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(Svgicons.facebook),
                          onTap: () async {
                            var url = data['Facebook'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(
                            Svgicons.instagram,
                          ),
                          onTap: () async {
                            var url = data['Instagram'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(
                            Svgicons.github,
                          ),
                          onTap: () async {
                            var url = data['Github'].toString();
                            launcUrlr(url);
                          },
                        ),
                        InkWell(
                          child: svgAsset(Svgicons.medium),
                          onTap: () async {
                            var url = data['Medium'].toString();
                            launcUrlr(url);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
