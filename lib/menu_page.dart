import 'package:flutter/material.dart';
import 'transaction_page.dart';
import 'MenuItemCard.dart';
import 'db_helper.dart';
import 'kopi_model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Controller untuk form input tambah menu baru
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  // Fungsi memunculkan pop-up formulir tambah menu
  void _tampilkanFormTambah() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Tambah Menu Kopi"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Nama Menu"),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: "Deskripsi"),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Harga (Angka)"),
              ),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(labelText: "Path Gambar (Contoh: assets/images/americano.jpg)"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (titleController.text.isNotEmpty && priceController.text.isNotEmpty) {
                // Buat objek kopi baru
                Kopi kopiBaru = Kopi(
                  title: titleController.text,
                  description: descController.text.isEmpty ? "-" : descController.text,
                  price: priceController.text,
                  image: imageController.text.isEmpty ? "assets/images/americano.jpg" : imageController.text,
                );

                // Simpan ke SQLite
                await DbHelper.instance.insertKopi(kopiBaru);

                // Bersihkan textfield
                titleController.clear();
                descController.clear();
                priceController.clear();
                imageController.clear();

                // Tutup dialog pop-up
                Navigator.pop(context);

                // Segarkan halaman utama agar menu baru langsung muncul
                setState(() {});
              }
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Kopi"),
      ),
      body: FutureBuilder<List<Kopi>>(
        future: DbHelper.instance.readAllKopi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.brown));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Menu kosong. Ketuk tombol + untuk menambah."));
          }

          final daftarKopi = snapshot.data!;

          return ListView.builder(
            itemCount: daftarKopi.length,
            itemBuilder: (context, index) {
              final kopi = daftarKopi[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TransactionPage(
                        menuTitle: kopi.title,
                        price: kopi.price,
                      ),
                    ),
                  );
                },
                child: MenuItemCard(
                  image: kopi.image,
                  title: kopi.title,
                  description: kopi.description,
                  price: kopi.price,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tampilkanFormTambah, // Memanggil fungsi pop-up form di atas
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}