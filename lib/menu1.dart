import 'package:flutter/material.dart';

class Menu1 extends StatelessWidget {
  const Menu1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          // Gambar Splash
          Image.asset(
            "assets/images/splash.png",
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 20),

          // Deskripsi di bawah gambar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Selamat datang di Coffee App!\nTemukan kopi favoritmu di sini.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}