
import 'package:aboumenew/screens/image/upload_image_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'consts/const_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Me',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: ColorUtil.kDarkGrey),
        fontFamily: "Roboto",
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: ColorUtil.kDarkGrey, fontSize: 20, fontFamily: 'Roboto'),
          color: ColorUtil.kGreen,
          elevation: 0,
        ),
        backgroundColor: ColorUtil.kGreen,
        canvasColor: ColorUtil.kGreen,
      ),
      home: const UploadImagePage(),
    );
  }
}
