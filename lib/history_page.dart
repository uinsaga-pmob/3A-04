import 'package:flutter/material.dart';
import 'database/db_helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future loadHistory() async {
    final data = await DBHelper.getTransactions();

    setState(() {
      history = data;
    });
  }

  Future deleteHistory(int id) async {
    await DBHelper.deleteTransaction(id);
    loadHistory();
  }

  Future clearAll() async {
    await DBHelper.clearHistory();
    loadHistory();
  }

  // Fungsi tambahan untuk merapikan tampilan string tanggal agar tidak kepanjangan
  String formatTanggal(String dateString) {
    if (dateString.length > 16) {
      return dateString.substring(0, 16); // Mengambil dari YYYY-MM-DD sampai Jam:Menit saja
    }
    return dateString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Transaksi",
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
            ),
            onPressed: () async {
              await clearAll();
            },
          ),
        ],
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "Belum ada transaksi",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.coffee,
                      ),
                    ),
                    title: Text(
                      item["nama_menu"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Qty : ${item["jumlah"]}"),
                        Text("Metode : ${item["metode"]}"),
                        Text(
                          formatTanggal(item["tanggal"]), // Memotong milidetik yang terlalu panjang
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Memberi jarak atas dan bawah
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rp ${item["total"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        // BAGIAN ICON SAMPAH YANG SUDAH DIKECILKAN
                        IconButton(
                          iconSize: 20.0, // <-- Ukuran ikon dikecilkan dari default (24.0)
                          padding: EdgeInsets.zero, // <-- Menghilangkan padding bawaan tombol agar hemat ruang
                          constraints: const BoxConstraints(), // <-- Memaksa ukuran tombol pas dengan ikonnya
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 15, 15, 15),
                          ),
                          onPressed: () {
                            deleteHistory(item["id"]);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}