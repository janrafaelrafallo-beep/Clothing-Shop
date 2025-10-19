import 'package:flutter/material.dart';
import 'package:flutter_application_1/prodcut.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/appdrawer.dart';
import 'package:provider/provider.dart';
import 'info.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final Set<String> favoriteProductIds = {};

  @override
  Widget build(BuildContext context) {
    final Map<String, Product> products = {
      'c1': Product(
        id: 'c1',
        name: 'Classic Black Tee',
        description: 'A soft cotton T-shirt perfect for any casual outfit.',
        price: 19.99,
        imageUrl:
            'https://down-ph.img.susercontent.com/file/sg-11134201-7rbkt-lpkk3zel420870',
      ),
      'c2': Product(
        id: 'c2',
        name: 'Denim Jacket',
        description: 'Stylish denim jacket that pairs well with everything.',
        price: 49.50,
        imageUrl:
            'https://down-ph.img.susercontent.com/file/ph-11134207-81ztd-megw9vbyy8znbc_tn.webp',
      ),
      'c3': Product(
        id: 'c3',
        name: 'Crop Top',
        description: 'Lightweight and breezy, perfect for sunny days.',
        price: 59.00,
        imageUrl:
            'https://lookaside.fbsbx.com/lookaside/crawler/media/?media_id=1250249107106427',
      ),
      'c4': Product(
        id: 'c4',
        name: 'Shorts',
        description: 'Comfortable and trendy, perfect for summer days.',
        price: 89.25,
        imageUrl:
            'https://img.lazcdn.com/g/p/d927ea06c9b93aa5abbd1fde19c17971.jpg_360x360q75.jpg_.webp',
      ),
      'c5': Product(
        id: 'c5',
        name: 'Cap',
        description: 'Comfortable and made for all-day wear.',
        price: 74.00,
        imageUrl:
            'https://cf.shopee.ph/file/ph-11134207-7rasg-m914zh7eryq5bd',
      ),
      'c6': Product(
        id: 'c6',
        name: 'Glow in the Dark Tee',
        description: 'Stay cozy and stand out with glow-in-the-dark print.',
        price: 64.75,
        imageUrl:
            'https://img.lazcdn.com/g/p/0c2746f07e624b6ef233bbfc552a4412.jpg_720x720q80.jpg',
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grasya Clothing'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        backgroundColor: const Color(0xFF222222),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CartPage(),
              

              ),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color.fromARGB(255, 152, 151, 151)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header image section
            Container(
              width: double.infinity,
              height: 130,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://lookaside.fbsbx.com/lookaside/crawler/media/?media_id=1349938550470815',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                color: const Color.fromARGB(137, 28, 28, 28),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Discover Your Style',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // ✅ Fixed: Product section header with shadow inside BoxDecoration
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient:  LinearGradient(colors:  [
                  Color.fromARGB(255, 49, 48, 48),
                  Color.fromARGB(255, 220, 220, 220),
                ]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: double.infinity,
              child: const Text(
                'Products',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Product list
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products.values.elementAt(index);
                  final isFavorite = favoriteProductIds.contains(product.id);

                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          // Product image
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(product.imageUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Product info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '₱${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  product.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          // Action buttons (cart, favorite, info)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add_shopping_cart),
                                color: Colors.black87,
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addItem(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${product.name} added to cart!'),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.grey.shade700,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.redAccent
                                      : Colors.grey.shade700,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite) {
                                      favoriteProductIds.remove(product.id);
                                    } else {
                                      favoriteProductIds.add(product.id);
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.info_outline),
                                color: Colors.grey.shade800,
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ProductInfoPage(product: product),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
