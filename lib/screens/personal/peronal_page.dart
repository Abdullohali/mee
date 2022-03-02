

import 'package:aboumenew/consts/informations.dart';
import 'package:aboumenew/screens/servicep/service_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();
 static CollectionReference personal =
      FirebaseFirestore.instance.collection('personal');

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
                    controller: Informations.specializationController,
                    validator: (value) =>
                        value!.isEmpty ? 'Specialization is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Specialization',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.typeController,
                    validator: (value) =>
                        value!.isEmpty ? 'Type is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.joinedController,
                    validator: (value) =>
                        value!.isEmpty ? 'Joined is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Joined',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.employerController,
                    validator: (value) =>
                        value!.isEmpty ? 'Employeer is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Employeer',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 20),
                  child: ElevatedButton(
                    onPressed: ()  {
                      if (_key.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ServicePage(),
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

 static Future<void> addUser3() {
    // Call the user's CollectionReference to add a new user
    return personal
        .add({
          'Employeer': Informations.employerController.text, // John Doe
          'joined': Informations.joinedController.text, // Stokes and Sons
          'specialization': Informations.specializationController.text,
          'type': Informations.typeController.text,
        })
        .then((value) => print("Info Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
