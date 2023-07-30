import 'package:flutter/material.dart';
import 'package:projeto_final/screens/all_products.dart';
import 'package:projeto_final/screens/homescreen.dart';
import 'package:projeto_final/screens/itens.dart';
import 'package:projeto_final/services/app_controler.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) { 
        return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.lightGreen,
          ),
          textTheme: const TextTheme(displayLarge: TextStyle(color: Colors.white))
        ),
        initialRoute: '/',
        routes: {
          '/':(BuildContext context) => const HomeScreen(),
          '/itens':(BuildContext context) => const Itens(title: "Novo item"),
          '/editar item':(BuildContext context) => const Itens(title: "Editar item"),
          '/produtos':(BuildContext context) => const AllProducts()
        },
      );
       },
      
    ); 
  }
}