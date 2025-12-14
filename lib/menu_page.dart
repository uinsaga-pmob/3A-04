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
                      price: "15000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/americano.jpg",
                title: "Americano",
                description: "Minuman kopi yang dibuat dari espresso yang ditambahkan air panas, sehingga rasanya lebih ringan dibanding espresso, mirip kopi hitam tapi tetap punya aroma khas espresso.",
                price: "15000",
              ),
            ),
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
                description: "Minuman kopi yang memadukan kopi hitam dengan manis alami dari gula aren, menghasilkan rasa manis legit, hangat, dan aroma khas karamel yang lembut.",
                price: "20000",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: " Latte",
                      price: "22000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/latte.jpg",
                title: "Kopi Latte",
                description: "Minuman kopi berbahan espresso dan susu steamed, dengan rasa lembut, creamy, dan tidak terlalu pahit, cocok untuk penikmat kopi yang ringan.",
                price: "22000",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: " Affogato",
                      price: "27000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/Affogato.jpeg",
                title: "Affogato",
                description: "Perpaduan espresso panas dan es krim vanila dingin. Rasa pahit kopi yang kuat berpadu dengan manis dan lembutnya es krim, menciptakan sensasi kontras yang kaya dan menyegarkan.",
                price: "27000",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: " Caramel",
                      price: "26000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/Caramel.jpeg",
                title: "Caramel",
                description: "Kombinasi espresso, susu hangat, dan sirup caramel yang manis dan creamy. Memiliki aroma caramel yang menggoda dengan rasa kopi yang lembut, cocok untuk pencinta kopi manis.",
                price: "26000",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
                      menuTitle: " Matcha Latte",
                      price: "24000",
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
                image: "assets/images/Matcha Latte.jpeg",
                title: "Matcha Latte",
                description: "Minuman berbahan bubuk matcha premium yang dicampur dengan susu creamy. Menghadirkan rasa earthy khas teh hijau Jepang yang halus, seimbang antara pahit ringan dan manis lembut.",
                price: "24000",
              ),
            ),
          ],
        ),
      ),
    );
  }
}