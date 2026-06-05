import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;

  const MenuItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Row(
        // Menyeimbangkan tinggi Row agar mengikuti elemen tertinggi
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              // Trik Jitu: Jika gambar aset tidak ditemukan, ganti dengan kontainer abu-abu + ikon kopi
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.coffee,
                    size: 50,
                    color: Colors.brown,
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Potong teks pakai titik-titik jika terlalu panjang
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.black54),
                    maxLines: 2, // Batasi deskripsi maksimal 2 baris agar tidak meluber
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Rp $price",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}