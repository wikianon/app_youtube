//Gerencia de estados com a classe 
//AppControler regra de negocio responsavel pela troca do tema noturno pelo tema claro.

import 'package:flutter/material.dart';

class AppController extends ChangeNotifier{
  
  static AppController instance = AppController();

  bool isDartTheme = false;

  changeTheme(){
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}