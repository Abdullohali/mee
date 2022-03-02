import 'package:flutter/cupertino.dart';

class Informations {
  static List<String> myInfo = ["3", "85%", "2", "3"];
  static List<String> myInfoTerms = [
    "Projects done",
    "Succesrate",
    "Teams",
    "Client reports"
  ];
  static final GlobalKey Formkey = GlobalKey();
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController surnameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController dateofbirthController =
      TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController bioController = TextEditingController();
  static final TextEditingController addresController = TextEditingController();

  //? ON THE WEB CONNECTIONS

  static final TextEditingController twitterController = TextEditingController();
  static final TextEditingController linkedController = TextEditingController();
  static final TextEditingController youtubController = TextEditingController();
  static final TextEditingController telegramController = TextEditingController();
  static final TextEditingController instagramController = TextEditingController();
  static final TextEditingController githubController = TextEditingController();
  static final TextEditingController mediumController = TextEditingController();
  static final TextEditingController facebookController = TextEditingController();
  static final TextEditingController webController = TextEditingController();

  //? FOR PERSONAL PAGE

  static final TextEditingController specializationController = TextEditingController();
  static final TextEditingController typeController = TextEditingController();
  static final TextEditingController joinedController = TextEditingController();
  static final TextEditingController employerController = TextEditingController();

  //? FOR SERVICES PAGE

  static final TextEditingController clientController = TextEditingController();
  static final TextEditingController projectsController = TextEditingController();
  static final TextEditingController succesController = TextEditingController();
  static final TextEditingController teamsController = TextEditingController();
}
