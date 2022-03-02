
import 'package:aboumenew/consts/informations.dart';
import 'package:aboumenew/consts/size_config.dart';
import 'package:aboumenew/screens/websites/websites_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Datapage extends StatelessWidget {
  Datapage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();
  static CollectionReference info =
      FirebaseFirestore.instance.collection('info');

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
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Name is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.surnameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Surname is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Surname',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.emailController,
                    validator: EmailValidator(
                        errorText: 'enter a valid email address'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.addresController,
                    validator: (value) =>
                        value!.isEmpty ? 'Address is required' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: Informations.dateofbirthController,
                    validator: (value) =>
                        value!.length != 8 ? 'Date of birth is required' : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Date of birth',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IntlPhoneField(
                    controller: Informations.phoneController,
                    validator: (value) => value!.length < 4 || value.length > 16
                        ? 'Phone number is required'
                        : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    initialCountryCode: 'UZ',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: getUniqueHeight(150),
                  child: TextFormField(
                    controller: Informations.bioController,
                    validator: (value) =>
                        value!.isEmpty ? 'Bio is required' : null,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      filled: true,
                      labelText: 'Bio',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebSitesPage(),
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

  static Future<void> addUser1() {
    // Call the user's CollectionReference to add a new user
    return info
        .add({
          'address': Informations.addresController.text, // John Doe
          'bio': Informations.bioController.text, // Stokes and Sons
          'datebirth': Informations.dateofbirthController.text,
          'email': Informations.emailController.text,
          'name': Informations.nameController.text,
          'phone': Informations.phoneController.text,
          'surname': Informations.surnameController.text,
        })
        .then((value) => print("Info Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
