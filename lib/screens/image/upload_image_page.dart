import 'dart:io';

import 'package:aboumenew/api/fire_base_api.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/screens/home/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({Key? key}) : super(key: key);

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? file;
  UploadTask? task;
  @override
  Widget build(BuildContext context) {
    final filename = file == null
        ? 'No file selected'
        : file!.path.toString().split('/').last;
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About You',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                margin: EdgeInsets.all(40),
                height: getUniqueHeight(300),
                width: getUniqueWidth(300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/upload.jpg'),
                        fit: BoxFit.cover)),
              ),
              onTap: _selectImage,
            ),
            Text(filename),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 20),
              child: ElevatedButton(
                onPressed: () async {
                  await _uploadImage();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false);
                },
                child: const Text('Upload'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
              ),
            ),
            task != null ? buildUploadStatus(task!) : Container(),
          ],
        ),
      ),
    );
  }

  Future _selectImage() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result == null) return;
    final path = result.files.single.path;
    setState(() {
      file = File(path!);
    });
  }

  Future _uploadImage() async {
    if (file == null) return;
    final fileName = file!.path.toString().split('/').last;
    final destination = 'files/$fileName';
    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
  }

  Widget buildUploadStatus(UploadTask tasl) => StreamBuilder<TaskSnapshot>(
        stream: task!.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            return Text("$percentage %");
          } else {
            return Container();
          }
        },
      );
}
