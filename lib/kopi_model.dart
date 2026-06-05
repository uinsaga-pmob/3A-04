class Kopi {
  final int? id;
  final String title;
  final String description;
  final String price;
  final String image;

  Kopi({
    this.id, 
    required this.title, 
    required this.description, 
    required this.price, 
    required this.image,
  });

  // Menerjemahkan dari Map (Database) ke Objek Flutter
  factory Kopi.fromMap(Map<String, dynamic> json) => Kopi(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
      );

  // Menerjemahkan dari Objek Flutter ke Map (untuk disimpan ke Database)
  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'image': image,
      };
}