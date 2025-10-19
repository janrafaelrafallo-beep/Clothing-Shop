import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop.dart';
import 'package:flutter_application_1/cart.dart'; 
import 'appdrawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 149, 149),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 76, 76),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),

      drawer: AppDrawer(),

      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 90,
            backgroundImage: NetworkImage(
           
              'https://cdn-icons-png.flaticon.com/512/3177/3177440.png',
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Jan Rafael Rafallo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "JanRafael.Rafallo@normi.edu.ph",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                _buildProfileItem(Icons.shopping_bag_rounded, 'Shopping', 'Cart'),
                _buildProfileItem(Icons.phone, "Phone", "09456783539"),
                _buildProfileItem(Icons.location_on, "Location", "Bayugan City"),
                _buildProfileItem(Icons.cake, "Birthday", 'Feb. 13, 2004'),
                _buildProfileItem(Icons.info, "About Me",
                    "Passionate Flutter developer with 5+ years of experience."),
              ],
            ),
          ),
        ],
      ),

  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color.fromARGB(255, 76, 76, 76),
        onTap: (index) {
          if (index == 0) {
           
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            );
          } else if (index == 1) {
        
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart), 
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
