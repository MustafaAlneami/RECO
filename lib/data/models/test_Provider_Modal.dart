import 'package:flutter/material.dart';

class TestProviderModal extends ChangeNotifier {
  int _age = 1;
  int get age => _age;

  void incremento() {
    _age++;
    notifyListeners();
  }
}
