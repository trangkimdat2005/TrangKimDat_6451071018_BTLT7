import 'package:flutter/material.dart';
import '../app/user_repository.dart';
import '../common/widget/loading_indicator.dart';
import '../common/widget/user_list_item.dart';

class Cau1Screen extends StatelessWidget {
  const Cau1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository repository = UserRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 1: Fetch User List'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
            child: FutureBuilder(
              future: repository.fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 48, color: Colors.red),
                        const SizedBox(height: 16),
                        Text('Lỗi: ${snapshot.error}'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Thử lại'),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  final users = snapshot.data!;
                  if (users.isEmpty) {
                    return const Center(child: Text('Không có dữ liệu'));
                  }
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return UserListItem(user: users[index]);
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
