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
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Qty : ${item["jumlah"]}",
                        ),
                        Text(
                          "Metode : ${item["metode"]}",
                        ),
                        Text(
                          item["tanggal"],
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rp ${item["total"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 15, 15, 15),
                          ),
                          onPressed: () {
                            deleteHistory(
                              item["id"],
                            );
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
