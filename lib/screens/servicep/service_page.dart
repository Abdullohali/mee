

import 'package:aboumenew/consts/informations.dart';
import 'package:aboumenew/screens/data/data_page.dart';
import 'package:aboumenew/screens/home/home_page.dart';
import 'package:aboumenew/screens/personal/peronal_page.dart';
import 'package:aboumenew/screens/websites/websites_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  ServicePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();
  static CollectionReference service =
      FirebaseFirestore.instance.collection('service');

  @override
  Widget build(BuildContext context) {
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
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.clientController,
                    validator: (value) =>
                        value!.isEmpty ? 'Clients is required' : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Clients',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.projectsController,
                    validator: (value) =>
                        value!.isEmpty ? 'Projects is required' : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Projects',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.succesController,
                    validator: (value) =>
                        value!.isEmpty ? 'Succes is required' : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Succes',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.teamsController,
                    validator: (value) =>
                        value!.isEmpty ? 'Teams is required' : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Teams',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        Datapage.addUser1();
                        WebSitesPage.addUser2();
                        PersonalPage.addUser3();
                        addUser4().then(
                          (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          ),
                        );
                      }
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

  static Future<void> addUser4() {
    // Call the user's CollectionReference to add a new user
    return service
        .add({
          'client': Informations.clientController.text, // John Doe
          'projects': Informations.projectsController.text, // Stokes and Sons
          'succes': Informations.succesController.text,
          'teams': Informations.teamsController.text,
        })
        .then((value) => print("Info Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
