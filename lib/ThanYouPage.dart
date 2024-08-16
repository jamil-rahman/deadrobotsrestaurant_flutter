import 'package:flutter/material.dart';
import 'package:flutterprgroup10/products_screen.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({super.key});

  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  bool _animated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _animated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Thank You', style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedRotation(
                turns: _animated ? 1 : 0,
                duration: const Duration(seconds: 2),
                child:
                AnimatedOpacity(
                  opacity: _animated ? 1 : 0.5,
                  duration: const Duration(seconds: 2),
                  child:
                  AnimatedSlide(
                    offset: _animated ? Offset.zero : const Offset(0, -1),
                    duration: const Duration(seconds: 2),
                    child:
                    Image.asset(
                      'images/logo.png',
                      width: _animated ? 150 : 100,
                      height: _animated ? 150 : 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your order is on the way',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Order Again!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
