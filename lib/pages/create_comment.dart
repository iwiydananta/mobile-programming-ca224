import 'package:flutter/material.dart';

class CreateCommentPage extends StatelessWidget {
  final Function(String name, String comment) onSubmit;

  const CreateCommentPage({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController commentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Comment"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Creator", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.brown),
                  const SizedBox(width: 8),
                  // TextField untuk memasukkan nama creator
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("Comment", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                hintText: "Enter your comment",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    commentController.text.isNotEmpty) {
                  onSubmit(nameController.text, commentController.text);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please fill in both fields."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Send", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.brown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}