import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'home_page.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context){
   
    return AnimatedBuilder(
      animation: AppController.instance, 
      builder:(context, child) {
       return MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
             primarySwatch: Colors.green,
             brightness: AppController.instance.isDartTheme 
             ? Brightness.dark 
             : Brightness.light,
            ), 
            //Configurando Rotas nomeadas
           initialRoute: '/',
           routes: {
            '/': (context) => const LoginPage(),
            '/home': (context) => HomePage(),
           },
         );
        }
      ); 
  }
}