import 'package:flutter/material.dart';

class WidgetConfig {
  static const TextStyle barTitleTextStyle =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(220, 220, 220, 1.0),
      foregroundColor: Colors.grey,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)));

  static const TextStyle buttonTextStyle =
      TextStyle(color: Colors.black, height: 1.0);

  static const TextStyle boldTextStyle =
      TextStyle(height: 1.0, fontWeight: FontWeight.bold);

  static const TextStyle uuidTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const InputDecoration featureRequiredNumberInputDecoration =
      InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none)));

  static Decoration inputDecoration = BoxDecoration(
      border: Border.all(width: 0.1, color: Colors.grey),
      borderRadius: BorderRadius.circular(4));

  static const InputDecoration resultInputDecoration =
      InputDecoration.collapsed(
          hintText: '',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none)));
}
