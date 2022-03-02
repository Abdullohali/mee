

import 'package:aboumenew/consts/const_colors.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetWrap extends StatelessWidget {
  GetWrap({Key? key}) : super(key: key);
  final service = FirebaseFirestore.instance.collection('service').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: service,
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
        return Wrap(
          spacing: 20,
          children: [
            wrapContainer(
                data.docs[0]['projects'].toString(), "Projects\ndone"),
            wrapContainer(data.docs[0]['succes'].toString(), "Success\nrate"),
            wrapContainer(data.docs[0]['teams'].toString(), "Teams"),
            wrapContainer(data.docs[0]['client'].toString(), "Client Reports"),
          ],
        );
      },
    );
  }

  Container wrapContainer(String info, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      height: getUniqueHeight(183),
      width: getUniqueWidth(158),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: ColorUtil.kWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            info,
            style: TextStyle(
                color: ColorUtil.kBlackGrey,
                fontSize: getUniqueWidth(58),
                fontWeight: FontWeight.w500),
          ),
          SelectableText(
            subtitle,
            style: TextStyle(
                color: ColorUtil.kBlackGrey,
                fontSize: getUniqueWidth(18),
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
