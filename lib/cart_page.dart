import 'package:flutter/material.dart';
import 'cart_service.dart';
import 'database/db_helper.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future checkout() async {
    for (var item in CartService.items) {
      await DBHelper.insertTransaction({
        "nama_menu": item.title,
        "harga": item.price,
        "jumlah": item.quantity,
        "metode": "QRIS",
        "total": item.subtotal,
        "tanggal": DateTime.now().toString(),
      });
    }

    CartService.clearCart();

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Checkout Berhasil"),
        content: const Text(
          "Pesanan berhasil disimpan",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void tambahQty(int index) {
    setState(() {
      CartService.items[index].quantity++;
    });
  }

  void kurangQty(int index) {
    setState(() {
      if (CartService.items[index].quantity > 1) {
        CartService.items[index].quantity--;
      } else {
        CartService.items.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
      ),
      body: CartService.items.isEmpty
          ? const Center(
              child: Text(
                "Keranjang masih kosong",
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: CartService.items.length,
                    itemBuilder: (context, index) {
                      final item = CartService.items[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.title),
                          subtitle: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () => kurangQty(index),
                              ),
                              Text(
                                "${item.quantity}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () => tambahQty(index),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "Rp ${item.subtotal}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total : Rp ${CartService.total}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: checkout,
                          child: const Text(
                            "Checkout",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}