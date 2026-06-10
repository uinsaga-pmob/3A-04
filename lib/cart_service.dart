import 'cart_item.dart';

class CartService {
  static final List<CartItem> items = [];

  static void addItem(CartItem item) {
    final index = items.indexWhere(
      (e) => e.title == item.title,
    );

    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(item);
    }
  }

  static void removeItem(CartItem item) {
    items.remove(item);
  }

  static int get total {
    return items.fold(
      0,
      (sum, item) => sum + item.subtotal,
    );
  }

  static void clearCart() {
    items.clear();
  }
}
