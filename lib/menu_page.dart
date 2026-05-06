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
<<<<<<< HEAD

            // CAPPUCCINO (BARU)
=======
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
<<<<<<< HEAD
                      menuTitle: "Cappuccino",
                      price: "23000",
=======
                      menuTitle: " Affogato",
                      price: "26000",
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
<<<<<<< HEAD
                image: "assets/images/cappuccino.jpg",
                title: "Cappuccino",
                description: "Espresso dengan susu dan foam tebal di atasnya.",
                price: "23000",
              ),
            ),

            // MOCHA (BARU)
=======
                image: "assets/images/Affogato.jpeg",
                title: "Affogato",
                description: "Perpaduan espresso panas dan es krim vanila dingin. Rasa pahit kopi yang kuat berpadu dengan manis dan lembutnya es krim, menciptakan sensasi kontras yang kaya dan menyegarkan.",
                price: "26000",
              ),
            ),
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
<<<<<<< HEAD
                      menuTitle: "Mocha",
                      price: "25000",
=======
                      menuTitle: " Caramel",
                      price: "27000",
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
<<<<<<< HEAD
                image: "assets/images/mocha.jpg",
                title: "Mocha",
                description: "Kopi dengan campuran coklat, manis dan creamy.",
                price: "25000",
              ),
            ),

            // ESPRESSO (BARU)
=======
                image: "assets/images/Caramel.jpeg",
                title: "Caramel",
                description: "Kombinasi espresso, susu hangat, dan sirup caramel yang manis dan creamy. Memiliki aroma caramel yang menggoda dengan rasa kopi yang lembut, cocok untuk pencinta kopi manis.",
                price: "27000",
              ),
            ),
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionPage(
<<<<<<< HEAD
                      menuTitle: "Espresso",
                      price: "12000",
=======
                      menuTitle: " Matcha Latte",
                      price: "24000",
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
                    ),
                  ),
                );
              },
              child: const MenuItemCard(
<<<<<<< HEAD
                image: "assets/images/espresso.jpg",
                title: "Espresso",
                description: "Kopi pekat dengan rasa kuat dan aroma tajam.",
                price: "12000",
=======
                image: "assets/images/Matcha Latte.jpeg",
                title: "Matcha Latte",
                description: "Minuman berbahan bubuk matcha premium yang dicampur dengan susu creamy. Menghadirkan rasa earthy khas teh hijau Jepang yang halus, seimbang antara pahit ringan dan manis lembut.",
                price: "24000",
>>>>>>> 4f044cbe0f69bf45be2d81440f04cdd12c073bd2
              ),
            ),
          ],
        ),
      ),
    );
  }
}