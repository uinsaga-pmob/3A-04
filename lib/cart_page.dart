import 'package:flutter/material.dart';
import 'cart_service.dart';
import 'database/db_helper.dart';
import 'cart_checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

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

  Future<void> hapusItem(int index) async {
    final item = CartService.items[index];

    bool? konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Hapus Produk"),
        content: Text(
          "Yakin ingin menghapus ${item.title} dari keranjang?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              "Hapus",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (konfirmasi == true) {
      setState(() {
        CartService.items.removeAt(index);
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${item.title} dihapus dari keranjang"),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  void kosongkanKeranjang() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Kosongkan Keranjang"),
        content: const Text(
          "Apakah Anda yakin ingin menghapus semua item di keranjang?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                CartService.clearCart();
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Keranjang berhasil dikosongkan"),
                ),
              );
            },
            child: const Text(
              "Hapus Semua",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
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
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
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
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Rp ${item.subtotal}",
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  tooltip: "Hapus Produk",
                                  onPressed: () => hapusItem(index),
                                ),
                              ],
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
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.delete_sweep),
                          label: const Text(
                            "Kosongkan Keranjang",
                          ),
                          onPressed: kosongkanKeranjang,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
  width: double.infinity,
  child: ElevatedButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CartCheckoutPage(),
          ),
        );

        setState(() {});
      },
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