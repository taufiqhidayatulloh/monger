import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String? name;

  void setName(String? name) {
    this.name = name;
    notifyListeners();
  }
}