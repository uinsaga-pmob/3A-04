import 'package:flutter/material.dart';
import 'transaction_page.dart';
import 'MenuItemCard.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Kopi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // AMERICANO
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Americano",
                      price: "15000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/americano.jpg",
                title: "Americano",
                description:
                    "Minuman kopi yang dibuat dari espresso + air panas.",
                price: "15000",
              ),
            ),

            // GULA AREN
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Gula Aren",
                      price: "20000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/gula_aren.jpg",
                title: "Gula Aren",
                description: "Kopi dengan manis alami gula aren.",
                price: "20000",
              ),
            ),

            // LATTE
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Latte",
                      price: "22000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/latte.jpg",
                title: "Kopi Latte",
                description:
                    "Espresso + susu, rasa creamy dan ringan.",
                price: "22000",
              ),
            ),

            // CAPPUCCINO
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Cappuccino",
                      price: "23000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/cappuccino.jpg",
                title: "Cappuccino",
                description:
                    "Espresso dengan susu dan foam tebal di atasnya.",
                price: "23000",
              ),
            ),

            // MOCHA
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Mocha",
                      price: "25000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/mocha.jpg",
                title: "Mocha",
                description:
                    "Kopi dengan campuran coklat, manis dan creamy.",
                price: "25000",
              ),
            ),

            // ESPRESSO
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Espresso",
                      price: "12000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/espresso.jpg",
                title: "Espresso",
                description:
                    "Kopi pekat dengan rasa kuat dan aroma tajam.",
                price: "12000",
              ),
            ),

            // AFFOGATO
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Affogato",
                      price: "26000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/affogato.jpeg",
                title: "Affogato",
                description:
                    "Perpaduan espresso panas dan es krim vanila dingin.",
                price: "26000",
              ),
            ),

            // CARAMEL
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Caramel",
                      price: "27000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/caramel.jpeg",
                title: "Caramel",
                description:
                    "Kombinasi espresso, susu hangat, dan sirup caramel.",
                price: "27000",
              ),
            ),

            // MATCHA LATTE
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Matcha Latte",
                      price: "24000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/matcha_latte.jpeg",
                title: "Matcha Latte",
                description:
                    "Minuman matcha premium dengan susu creamy.",
                price: "24000",
              ),
            ),
          ],
        ),
      ),
    );
  }
}