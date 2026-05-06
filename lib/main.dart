import 'package:flutter/material.dart';
import 'package:template/splash_screen.dart';
import 'package:template/home_page.dart';
import 'package:template/main.dart';
import 'package:template/menu_page.dart';
import 'package:template/MenuItemCard.dart';
import 'package:template/transaction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kopie",
      // Halaman awal adalah SplashScreen
      home: const SplashScreen(),
      routes: {
        '/home': (_) => const HomePage(),
        '/menu': (_) => const MenuPage(),
        // TransactionPage tidak dimasukkan ke routes karena butuh parameter
      },
    );
  }
} 