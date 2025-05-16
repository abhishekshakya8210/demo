import 'package:flutter/material.dart';
class ChatProvider with ChangeNotifier{
  int _count = 50;
  int get count => _count;
  void setCount(){
    _count++;
    notifyListeners();
  }
}