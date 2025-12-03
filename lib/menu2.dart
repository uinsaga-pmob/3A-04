import 'package:flutter/material.dart';

class Menu2 extends StatelessWidget {
  const Menu2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // ------------------ FOTO ATAS ------------------
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 330,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    "assets/images/gula aren.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 35,
                left: 15,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ------------------ RATING ------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.black, size: 22),
              Icon(Icons.star, color: Colors.black, size: 22),
              Icon(Icons.star, color: Colors.black, size: 22),
              Icon(Icons.star, color: Colors.black, size: 22),
              Icon(Icons.star_border, color: Colors.black, size: 22),
            ],
          ),

          const SizedBox(height: 10),

          // ------------------ DESKRIPSI ------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Deskripsi\n"
              "minuman berbasis kopi yang dicampur dengan gula aren, "
              "memberikan rasa manis alami yang khas, kaya, dan "
              "seringkali sedikit berkaramel",
              style: const TextStyle(fontSize: 15, height: 1.4),
              textAlign: TextAlign.left,
            ),
          ),

          const SizedBox(height: 20),

          // ------------------ HARGA & TOMBOL ------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Harga
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Harga", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text(
                      "Rp 17.000",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),

                // Tombol Tambah
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text("Tambah"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}