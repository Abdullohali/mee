 import 'package:flutter/material.dart';

getController(TextEditingController controller) {
    (controller) {
      if (controller.text.isEmpty) {
        return null;
      }
      return controller.text;
    };
  }