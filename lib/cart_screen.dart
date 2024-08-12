import 'package:flutter/material.dart';
import 'Product.dart';
import 'Cart.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.asset(item.product.image, width: 50, height: 50),
            title: Text(item.product.title),
            subtitle: Text('${item.quantity} x \$${item.product.price.toStringAsFixed(2)}'),
            trailing: Text('\$${(item.quantity * item.product.price).toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
