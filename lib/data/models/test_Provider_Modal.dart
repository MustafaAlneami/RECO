import 'package:flutter/material.dart';

class TestProviderModal extends ChangeNotifier {
  final int _age = 1;
  int get age => _age;
  int incremento() {
    int results = age + 1;
    notifyListeners();
    return results;
  }
}
