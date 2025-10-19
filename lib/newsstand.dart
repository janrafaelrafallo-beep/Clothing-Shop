import 'package:flutter/material.dart';
import 'appdrawer.dart';

class NewsstandPage extends StatelessWidget {
  final List<Map<String, String>> fakeNews = [
    {
      'title': 'Top 10 Outfits for Summer',
      'image': 'https://images.unsplash.com/photo-1521335629791-ce4aec67dd53',
    },
    {
      'title': 'How to Choose Your Signature Style',
      'image': 'https://images.unsplash.com/photo-1520975918311-3c52d3ed9d59',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothing Newsstand'),
        backgroundColor: const Color.fromARGB(255, 79, 78, 79),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: fakeNews.length,
        itemBuilder: (context, index) {
          final item = fakeNews[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
