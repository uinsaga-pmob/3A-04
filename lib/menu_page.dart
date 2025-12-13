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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Americano",
                      price: "15.000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/americano.jpg",
                title: "Americano",
                description: "Minuman kopi yang dibuat dari espresso yang ditambahkan air panas, sehingga rasanya lebih ringan dibanding espresso, mirip kopi hitam tapi tetap punya aroma khas espresso.",
                price: "15.000",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: "Gula Aren",
                      price: "20.000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/gula aren.jpg",
                title: "Gula Aren",
                description: "Minuman kopi yang memadukan kopi hitam dengan manis alami dari gula aren, menghasilkan rasa manis legit, hangat, dan aroma khas karamel yang lembut.",
                price: "20.000",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: " Latte",
                      price: "22.000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/latte.jpg",
                title: "Kopi Latte",
                description: "Minuman kopi berbahan espresso dan susu steamed, dengan rasa lembut, creamy, dan tidak terlalu pahit, cocok untuk penikmat kopi yang ringan.",
                price: "22.000",
              ),
            ),
          ],
        ),
      ),
    );
  }
}