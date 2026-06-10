class CartItem {
  final String title;
  final String image;
  final int price;
  int quantity;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  int get subtotal => price * quantity;
}
