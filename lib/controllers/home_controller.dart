import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier{
  int index = 0;

  void increment(){
    index +=1;
    notifyListeners();
  }
}