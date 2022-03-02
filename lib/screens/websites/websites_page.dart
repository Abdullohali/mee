
import 'package:aboumenew/consts/informations.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/function/get_controller.dart';
import 'package:aboumenew/screens/personal/peronal_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WebSitesPage extends StatelessWidget {
  WebSitesPage({Key? key}) : super(key: key);
  static CollectionReference webAccount =
      FirebaseFirestore.instance.collection('webAccount');

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.webController,
                    validator: getController(Informations.webController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Website',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.twitterController,
                    validator: getController(Informations.twitterController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Twitter',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.linkedController,
                    validator: getController(Informations.linkedController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Linkedin',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.youtubController,
                    validator: getController(Informations.youtubController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Youtube',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.telegramController,
                    validator: getController(Informations.telegramController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Telegram',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.instagramController,
                    validator: getController(Informations.instagramController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Instagram',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.githubController,
                    validator: getController(Informations.githubController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Github',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.mediumController,
                    validator: getController(Informations.mediumController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Medium',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.facebookController,
                    validator: getController(Informations.facebookController),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Facebook',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PersonalPage(),
                        ),
                      );
                    },
                    child: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> addUser2() {
    // Call the user's CollectionReference to add a new user
    return webAccount
        .add({
          'Facebook': Informations.facebookController.text, // John Doe
          'Github': Informations.githubController.text, // Stokes and Sons
          'Instagram': Informations.instagramController.text,
          'Linkedin': Informations.linkedController.text,
          'Medium': Informations.mediumController.text,
          'Telegram': Informations.telegramController.text,
          'Twitter': Informations.twitterController.text,
          'Website': Informations.webController.text,
          'Youtub': Informations.youtubController.text,
        })
        .then((value) => print("Web Account Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
