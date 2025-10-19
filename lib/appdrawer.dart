import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 60, 59, 60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.checkroom, color: Color.fromARGB(255, 87, 85, 87), size: 30),
                ),
                SizedBox(height: 10),
                Text(
                  'Clothing Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Style that fits you',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // 🛍️ Shop
          ListTile(
            leading: const Icon(Icons.store, color: Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/shop'),
          ),

          // 📰 Newsstand
          ListTile(
            leading: const Icon(Icons.article, color: Color.fromARGB(255, 0, 0, 0)),
            title: const Text('Newsstand'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/news'),
          ),

          // 👤 Profile
          ListTile(
            leading: const Icon(Icons.person, color: Color.fromARGB(255, 159, 159, 159)),
            title: const Text('Profile'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/profile'),
          ),

          // 🛒 Cart
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 115, 115, 115)),
            title: const Text('Cart'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/cart'),
          ),
        ],
      ),
    );
  }
}
