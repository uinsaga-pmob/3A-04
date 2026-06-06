import 'package:flutter/material.dart';
import 'transaction_page.dart';
import 'MenuItemCard.dart';
import 'history_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> menuList = [
      {
        "title": "Americano",
        "description":
            "Minuman kopi yang dibuat dari espresso + air panas.",
        "price": "15000",
        "image": "assets/images/americano.jpg",
      },
      {
        "title": "Gula Aren",
        "description":
            "Kopi dengan manis alami gula aren.",
        "price": "20000",
        "image": "assets/images/gula_aren.jpeg",
      },
      {
        "title": "Kopi Latte",
        "description":
            "Espresso + susu, rasa creamy dan ringan.",
        "price": "22000",
        "image": "assets/images/latte.jpg",
      },
      {
        "title": "Cappuccino",
        "description":
            "Espresso dengan susu dan foam tebal di atasnya.",
        "price": "23000",
        "image": "assets/images/cappucino.jpeg",
      },
      {
        "title": "Mocha",
        "description":
            "Kopi dengan campuran coklat, manis dan creamy.",
        "price": "25000",
        "image": "assets/images/moca.jpg",
      },
      {
        "title": "Espresso",
        "description":
            "Kopi pekat dengan rasa kuat dan aroma tajam.",
        "price": "12000",
        "image": "assets/images/espresso.jpg",
      },
      {
        "title": "Affogato",
        "description":
            "Perpaduan espresso panas dan es krim vanila dingin.",
        "price": "26000",
        "image": "assets/images/affogato.jpeg",
      },
      {
        "title": "Caramel",
        "description":
            "Kombinasi espresso, susu hangat, dan sirup caramel.",
        "price": "27000",
        "image": "assets/images/caramel.jpeg",
      },
      {
        "title": "Matcha Latte",
        "description":
            "Minuman matcha premium dengan susu creamy.",
        "price": "24000",
        "image": "assets/images/matcha_latte.jpeg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("☕ Menu Kopi"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: menuList.length,

        itemBuilder: (context, index) {

          final menu = menuList[index];

          return GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TransactionPage(
                    menuTitle: menu["title"]!,
                    price: menu["price"]!,
                    image: menu["image"]!,
                  ),
                ),
              );
            },

            child: MenuItemCard(
              image: menu["image"]!,
              title: menu["title"]!,
              description: menu["description"]!,
              price: menu["price"]!,
            ),
          );
        },
      ),

floatingActionButton:
    FloatingActionButton.extended(

  backgroundColor: Colors.brown,

  icon: const Icon(
    Icons.history,
    color: Colors.white,
  ),

  label: const Text(
    "Riwayat",
    style: TextStyle(
      color: Colors.white,
    ),
  ),

  onPressed: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const HistoryPage(),
      ),
    );
  },
),
    );
  }
}