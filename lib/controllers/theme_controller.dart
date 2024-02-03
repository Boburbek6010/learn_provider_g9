import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier{

  ThemeMode _theme = ThemeMode.light;

  ThemeMode get currentTheme => _theme;

  void changeTheme(){
    if(_theme == ThemeMode.light){
      _theme = ThemeMode.dark;
    }else{
      _theme = ThemeMode.light;
    }
    notifyListeners();
  }


}