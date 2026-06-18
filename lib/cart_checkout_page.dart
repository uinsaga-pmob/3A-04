import 'package:flutter/material.dart';
import 'cart_service.dart';
import 'database/db_helper.dart';

class CartCheckoutPage extends StatefulWidget {
  const CartCheckoutPage({super.key});

  @override
  State<CartCheckoutPage> createState() => _CartCheckoutPageState();
}

class _CartCheckoutPageState extends State<CartCheckoutPage> {
  String paymentMethod = "QRIS";
  final TextEditingController cashController =
      TextEditingController();

  int get cashAmount =>
      int.tryParse(cashController.text) ?? 0;

  int get change =>
      cashAmount - total;

  int get subtotal => CartService.total;

  int get serviceFee => 2000;

  int get total => subtotal + serviceFee;

  Future<void> saveTransaction() async {
    for (var item in CartService.items) {
      await DBHelper.insertTransaction({
        "nama_menu": item.title,
        "harga": item.price,
        "jumlah": item.quantity,
        "metode": paymentMethod,
        "total": item.subtotal,
        "tanggal": DateTime.now().toString(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),
      appBar: AppBar(
        title: const Text("Checkout Keranjang"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: CartService.items.map((item) {
                    return ListTile(
                      leading: Image.asset(
                        item.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.title),
                      subtitle: Text(
                        "${item.quantity} x Rp ${item.price}",
                      ),
                      trailing: Text(
                        "Rp ${item.subtotal}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Metode Pembayaran",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: paymentMethod,
                      items: const [
                        DropdownMenuItem(
                          value: "QRIS",
                          child: Text("QRIS"),
                        ),
                        DropdownMenuItem(
                          value: "Cash",
                          child: Text("Cash"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value!;
                        });
                      },
                    ),
                    if (paymentMethod == "Cash") ...[
                      const SizedBox(height: 15),

                      TextFormField(
                        controller: cashController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Uang Tunai",
                          border: OutlineInputBorder(),
                          prefixText: "Rp ",
                        ),
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Kembalian",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            change >= 0
                                ? "Rp $change"
                                : "Uang Kurang Rp ${change.abs()}",
                            style: TextStyle(
                              color:
                                  change >= 0 ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ], 
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildRow(
                      "Subtotal",
                      "Rp $subtotal",
                    ),
                    const SizedBox(height: 10),
                    buildRow(
                      "Biaya Layanan",
                      "Rp $serviceFee",
                    ),
                    const Divider(),
                    buildRow(
                      "Total",
                      "Rp $total",
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: () async {
                  if (paymentMethod == "Cash" &&
                      cashAmount < total) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Uang tunai tidak mencukupi",
                        ),
                      ),
                    );
                    return;
                  }

                  final int finalTotal = total;

                  await saveTransaction();

                  CartService.clearCart();

                  if (!context.mounted) return;

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text(
                        "Pembayaran Berhasil",
                      ),
                      content: Text(
                        "Total pembayaran Rp $finalTotal",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  "Bayar Sekarang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(
    String title,
    String value, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 18 : 16,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 18 : 16,
          ),
        ),
      ],
    );
  }
}
