import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'newsstand.dart';
import 'profile.dart';
import 'shop.dart';
import 'cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: ClothingShopApp(),
    ),
  );
}

class ClothingShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        '/shop': (_) => ShopPage(),
        '/cart': (_) => CartPage(),
        '/news': (_) => NewsstandPage(),
        '/profile': (_) => ProfilePage(),
        '/info': (_) => ShopPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ShopPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            
            'https://www.google.com/imgres?q=grasya%20clothing&imgurl=https%3A%2F%2Fmms.img.susercontent.com%2Fph-11134216-7r98u-lt7x5pdr9nwk5a&imgrefurl=https%3A%2F%2Fshopee.ph%2Fgrasya.worldwide&docid=IhKxa7x0kci_xM&tbnid=ywrUnX14hE_noM&vet=12ahUKEwj35tiLtrCQAxWor1YBHUKqPVAQM3oECBUQAA..i&w=2048&h=2048&hcb=2&ved=2ahUKEwj35tiLtrCQAxWor1YBHUKqPVAQM3oECBUQAA',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(150, 0, 0, 0),
                  Color.fromARGB(149, 53, 53, 53),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.shopping_bag,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Text(
                  'Clothing House',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Style for every occasion',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
