import 'package:flutter/material.dart';
import 'package:myapp/widgets/post_item_search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate a list of PostItems (replace with real data as needed)
    final listPostItems = List.generate(12, (index) => const PostItem());

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                'Cari moment....',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Three columns for grid layout
            crossAxisSpacing: 1,
            mainAxisSpacing: 8,
            childAspectRatio: 1, // Ensures square aspect for images
          ),
          itemCount: listPostItems.length,
          itemBuilder: (context, index) {
            return listPostItems[index];
          },
        ),
      ),
    );
  }
}