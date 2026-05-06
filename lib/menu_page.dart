import 'package:flutter/material.dart';
import 'transaction_page.dart';
import 'MenuItemCard.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Kopi")),
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
                description: "Minuman kopi yang dibuat dari espresso + air panas.",
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
                image: "assets/images/gula aren.jpg",
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
                description: "Espresso + susu, rasa creamy dan ringan.",
                price: "22000",
              ),
            ),

            // CAPPUCCINO (BARU)
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
                description: "Espresso dengan susu dan foam tebal di atasnya.",
                price: "23000",
              ),
            ),

            // MOCHA (BARU)
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
                description: "Kopi dengan campuran coklat, manis dan creamy.",
                price: "25000",
              ),
            ),

            // ESPRESSO (BARU)
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
                description: "Kopi pekat dengan rasa kuat dan aroma tajam.",
                price: "12000",
              ),
            ),
          ],
        ),
      ),
    );
  }
}