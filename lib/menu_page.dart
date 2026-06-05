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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  // 1. FORM FORMULIR EDIT MENU (Otomatis Terisi Data Lama)
  void _tampilkanFormEdit(Kopi kopiLama) {
    titleController.text = kopiLama.title;
    descController.text = kopiLama.description;
    priceController.text = kopiLama.price;
    imageController.text = kopiLama.image;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Menu: ${kopiLama.title}"),
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
                decoration: const InputDecoration(labelText: "Path Gambar"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _bersihkanController();
              Navigator.pop(context);
            },
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (titleController.text.isNotEmpty && priceController.text.isNotEmpty) {
                Kopi kopiDiperbarui = Kopi(
                  id: kopiLama.id, // ID lama wajib disertakan agar database tahu baris mana yang diubah
                  title: titleController.text,
                  description: descController.text.isEmpty ? "-" : descController.text,
                  price: priceController.text,
                  image: imageController.text.isEmpty ? "assets/images/americano.jpg" : imageController.text,
                );

                await DbHelper.instance.updateKopi(kopiDiperbarui);
                _bersihkanController();

                Navigator.pop(context);
                setState(() {}); // Segarkan tampilan layar
              }
            },
            child: const Text("Perbarui"),
          ),
        ],
      ),
    );
  }

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
                decoration: const InputDecoration(labelText: "Path Gambar"),
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
                Kopi kopiBaru = Kopi(
                  title: titleController.text,
                  description: descController.text.isEmpty ? "-" : descController.text,
                  price: priceController.text,
                  image: imageController.text.isEmpty ? "assets/images/americano.jpg" : imageController.text,
                );

                await DbHelper.instance.insertKopi(kopiBaru);
                _bersihkanController();

                Navigator.pop(context);
                setState(() {});
              }
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  void _bersihkanController() {
    titleController.clear();
    descController.clear();
    priceController.clear();
    imageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Kopi"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
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

              return Dismissible(
                key: Key(kopi.id.toString()),
                // MENGAKTIFKAN DUA ARAH GESER: Kiri (Hapus) dan Kanan (Edit)
                direction: DismissDirection.horizontal, 
                
                // Tampilan latar saat digeser ke Kanan (EDIT)
                background: Container(
                  color: Colors.blue,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.edit, color: Colors.white, size: 30),
                ),
                
                // Tampilan latar saat digeser ke Kiri (HAPUS)
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white, size: 30),
                ),
                
                // Logika pemisah aksi saat pengguna menggeser kartu menu
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    // Jika digeser ke KANAN, jalankan form edit dan gagalkan efek hilangnya widget
                    _tampilkanFormEdit(kopi);
                    return false; 
                  } else {
                    // Jika digeser ke KIRI, munculkan pop-up konfirmasi hapus seperti kemarin
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Konfirmasi Hapus"),
                          content: Text("Apakah kamu yakin ingin menghapus menu '${kopi.title}'?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart && kopi.id != null) {
                    await DbHelper.instance.deleteKopi(kopi.id!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${kopi.title} berhasil dihapus")),
                    );
                    setState(() {});
                  }
                },
                child: GestureDetector(
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
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tampilkanFormTambah,
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}