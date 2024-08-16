import 'package:flutter/material.dart';
import 'Product.dart';
import 'Cart.dart';
import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<CartItem> _cartItems = [];
  final TextEditingController _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  void _addToCart(Product product, int quantity) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.product == product);
      if (index >= 0) {
        _cartItems[index] = CartItem(
          product: product,
          quantity: _cartItems[index].quantity + quantity,
        );
      } else {
        _cartItems.add(CartItem(product: product, quantity: quantity));
      }
    });
  }

  final String title = "Products";
  final List<Product> products = [
    Product(
      title: 'Big Mac King',
      image: 'images/burger1.png',
      price: 9.99,
      calories: 300,
      description:
      'A delicious burger with two patties, special sauce, and lettuce.',
    ),
    Product(
      title: 'Spicy McWhopper',
      image: 'images/burger2.png',
      price: 4.99,
      calories: 350,
      description:
      'A spicy twist on the classic whopper, topped with jalapeños and spicy sauce.',
    ),
    Product(
      title: 'Chicken Bacon Deluxe',
      image: 'images/burger3.png',
      price: 14.99,
      calories: 400,
      description:
      'Grilled chicken, crispy bacon, and creamy ranch sauce on a fresh bun.',
    ),
    Product(
      title: 'Veggie Supreme',
      image: 'images/burger4.png',
      price: 14.99,
      calories: 250,
      description:
      'A tasty veggie burger with all the fresh toppings and sauces.',
    ),
    Product(
      title: 'Triple Stack BBQ',
      image: 'images/burger5.png',
      price: 19.99,
      calories: 320,
      description:
      'Three juicy beef patties topped with BBQ sauce and onion rings.',
    ),
    Product(
      title: 'Blue Cheese Bliss',
      image: 'images/burger6.png',
      price: 19.99,
      calories: 370,
      description:
      'A rich blue cheese sauce paired with grilled onions and a perfectly cooked beef patty.',
    ),
    Product(
      title: 'Classic Cheeseburger',
      image: 'images/burger1.png',
      price: 9.99,
      calories: 280,
      description:
      'A classic cheeseburger with a beef patty, melted cheese, and a soft bun.',
    ),
    Product(
      title: 'Mushroom Swiss Melt',
      image: 'images/burger3.png',
      price: 14.99,
      calories: 330,
      description:
      'Sautéed mushrooms and melted Swiss cheese over a juicy beef patty.',
    ),
    Product(
      title: 'Avocado Bacon Burger',
      image: 'images/burger5.png',
      price: 19.99,
      calories: 350,
      description:
      'Fresh avocado slices and crispy bacon atop a beef patty with melted cheese.',
    ),
    Product(
      title: 'The Inferno',
      image: 'images/burger2.png',
      price: 4.99,
      calories: 360,
      description:
      'A fiery burger with pepper jack cheese, jalapeños, and a spicy sriracha mayo.',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Hero widget for my logo_destination
            Hero(
              tag: 'logoHero',
              child: Image.asset('images/logo.png', height: 40),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Try the Juiciest Burgers in Town',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: GestureDetector(
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      product.image,
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '${product.calories} cal',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(top: 20.0),
                                                    child: Image.asset(
                                                      product.image,
                                                      height: 120,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    product.title,
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    product.description,
                                                    style: const TextStyle(fontSize: 16),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    '\$${product.price.toStringAsFixed(2)}',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    '${product.calories} cal',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blueGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextField(
                                                    keyboardType:
                                                    TextInputType.number,
                                                    controller: _myController,
                                                    decoration: const InputDecoration(
                                                      labelText: 'Quantity',
                                                      labelStyle:
                                                      TextStyle(color: Colors.black),
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.blue),
                                                    onPressed: () {
                                                      _addToCart(
                                                        product,
                                                        int.parse(
                                                            _myController.text),
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Add to Cart',
                                                      style: TextStyle(color: Colors.white),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange),
                                    child: const Text('Buy Now',
                                      style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(cartItems: _cartItems),
            ),
          );
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }
}
