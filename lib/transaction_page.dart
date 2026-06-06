import 'package:flutter/material.dart';
import 'database/db_helper.dart';

class TransactionPage extends StatefulWidget {
  final String menuTitle;
  final String price;
  final String image;

  const TransactionPage({
    super.key,
    required this.menuTitle,
    required this.price,
    required this.image,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int quantity = 1;

  String paymentMethod = "QRIS";

  int get itemPrice => int.parse(widget.price);

  int get subtotal => itemPrice * quantity;

  int get serviceFee => 2000;

  int get total => subtotal + serviceFee;

  Future<void> saveTransaction() async {
    await DBHelper.insertTransaction({
      "nama_menu": widget.menuTitle,
      "harga": itemPrice,
      "jumlah": quantity,
      "metode": paymentMethod,
      "total": total,
      "tanggal": DateTime.now().toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),

      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // FOTO MENU
            Container(
              height: 220,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // INFO PRODUK
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      widget.menuTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Nikmati kopi pilihan dengan kualitas terbaik.",
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Rp ${widget.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // QUANTITY
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    const Text(
                      "Jumlah",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [

                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.brown,
                          ),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                        ),

                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.brown,
                          ),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // METODE PEMBAYARAN
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

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
                          value: "Dana",
                          child: Text("Dana"),
                        ),

                        DropdownMenuItem(
                          value: "GoPay",
                          child: Text("GoPay"),
                        ),

                        DropdownMenuItem(
                          value: "OVO",
                          child: Text("OVO"),
                        ),
                      ],

                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DETAIL PEMBAYARAN
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

                  await saveTransaction();

                  if (!context.mounted) return;

                  showDialog(
                    context: context,

                    builder: (_) => AlertDialog(
                      title: const Text(
                        "Pembayaran Berhasil",
                      ),

                      content: Text(
                        "Total pembayaran Rp $total",
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
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [

        Text(
          title,
          style: TextStyle(
            fontWeight: isBold
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: isBold ? 18 : 16,
          ),
        ),

        Text(
          value,
          style: TextStyle(
            fontWeight: isBold
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: isBold ? 18 : 16,
          ),
        ),
      ],
    );
  }
}