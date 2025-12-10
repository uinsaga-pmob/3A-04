import 'package:flutter/material.dart';
import 'package:template/home_page.dart';
import 'package:template/splash_screen.dart';
import 'package:template/home_page.dart';
import 'package:template/my_order_page.dart';
import 'package:template/menu1.dart';
import 'package:template/menu2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyOrderPage(),
    );
  }
}
