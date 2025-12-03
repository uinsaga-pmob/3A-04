import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6B98A), // warna background seperti gambar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "My Order",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),

      body: Column(
        children: [
          // ITEM CARD
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFAD7260),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Americano",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                // MIN BUTTON
                Icon(Icons.remove_circle_outline, color: Colors.white),

                const SizedBox(width: 8),

                // QTY
                const Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                const SizedBox(width: 8),

                // PLUS BUTTON
                Icon(Icons.add_circle_outline, color: Colors.white),

                const SizedBox(width: 12),

                // DELETE BUTTON
                Icon(Icons.delete_outline, color: Colors.white),
              ],
            ),
          ),

          const Spacer(),

          // LINE
          Container(
            height: 1,
            color: Colors.black54,
          ),

          // TOTAL ROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  "21.000",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // PRINT BILL BUTTON
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAD7260),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                "Print Bills",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
