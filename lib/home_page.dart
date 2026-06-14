import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kopie"),
      ),
      body: Column(
        children: [
          // HEADER (lebih clean, tidak pakai translate lagi)
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.brown[200],
              image: const DecorationImage(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // TEXT WELCOME
          const Text(
            "Selamat Datang di Kopie ☕",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Nikmati berbagai pilihan kopi terbaik dengan cita rasa khas dan harga terjangkau.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          ),

          const SizedBox(height: 40),

          // BUTTON MENU
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Lihat Menu Kopi",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          const Spacer(),

          // FOOTER
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "© 2026 Kopie App",
              style: TextStyle(color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}