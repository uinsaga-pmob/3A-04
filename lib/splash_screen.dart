import 'package:flutter/material.dart';
import 'package:template/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        203,
        119,
        88,
      ), // background coklat
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image(image: AssetImage("assets/images/splash.png")),
            Text(
              "Kopie",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
