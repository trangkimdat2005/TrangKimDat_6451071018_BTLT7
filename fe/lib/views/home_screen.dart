import 'package:flutter/material.dart';
import '../cau1/views/cau1_screen.dart';
import '../cau2/views/cau2_screen.dart';
import '../cau3/views/cau3_screen.dart';
import '../cau4/views/cau4_screen.dart';
import '../cau5/views/cau5_screen.dart';
import '../cau6/views/cau6_screen.dart';
import '../cau7/views/cau7_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng Danh bạ'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: const Text(
              'MSSV: 6451071018',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildNavButton(
                  context,
                  1,
                  'Bài 1: Fetch User List (GET API)',
                  Icons.person,
                ),
                _buildNavButton(
                  context,
                  2,
                  'Bài 2: Product Detail (GET API)',
                  Icons.shopping_cart,
                ),
                _buildNavButton(
                  context,
                  3,
                  'Bài 3: Create Post (POST API)',
                  Icons.add_circle,
                ),
                _buildNavButton(
                  context,
                  4,
                  'Bài 4: Update User Info (PUT API)',
                  Icons.edit,
                ),
                _buildNavButton(
                  context,
                  5,
                  'Bài 5: Delete Item (DELETE API)',
                  Icons.delete,
                ),
                _buildNavButton(
                  context,
                  6,
                  'Bài 6: Search API (Query Params)',
                  Icons.search,
                ),
                _buildNavButton(
                  context,
                  7,
                  'Bài 7: Pull to Refresh (Data Reload)',
                  Icons.refresh,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    int cauNumber,
    String title,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '$cauNumber',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          if (cauNumber == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau1Screen()),
            );
          } else if (cauNumber == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau2Screen()),
            );
          } else if (cauNumber == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau3Screen()),
            );
          } else if (cauNumber == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau4Screen()),
            );
          } else if (cauNumber == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau5Screen()),
            );
          } else if (cauNumber == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau6Screen()),
            );
          } else if (cauNumber == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cau7Screen()),
            );
          }
        },
      ),
    );
  }
}
