import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Transform.translate(
            offset: Offset(0, -50),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                image: DecorationImage(
                  image: AssetImage("assets/images/splash.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari Kopi mu",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          //produk2
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image(
                          height: 130,
                          image: AssetImage("assets/images/americano.jpg"),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("americano")),
                        Column(children: [Icon(Icons.star), Text("5")]),
                      ],
                    ),

                    Row(
                      children: [
                        Image(
                          height: 130,
                          image: AssetImage("assets/images/gula aren.jpg"),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("gula aren")),
                        Icon(Icons.star),
                      ],
                    ),

                    Row(
                      children: [
                        Image(
                          height: 130,
                          image: AssetImage("assets/images/latte.jpg"),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Latte")),
                        Icon(Icons.star),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
