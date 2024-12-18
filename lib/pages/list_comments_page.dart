import 'package:flutter/material.dart';
import 'create_comment.dart';

class ListCommentsPage extends StatefulWidget {
  const ListCommentsPage({super.key});

  @override
  State<ListCommentsPage> createState() => _ListCommentsPageState();
}

class _ListCommentsPageState extends State<ListCommentsPage> {
  // List untuk menyimpan komentar
  final List<Map<String, String>> _comments = [
    {"name": "Andi", "comment": "Mantap sekali!"},
    {"name": "Budi", "comment": "Keren banget."},
  ];

  // Fungsi untuk menambah komentar baru
  void _addComment(String name, String comment) {
    setState(() {
      _comments.add({"name": name, "comment": comment});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.primaries[index % Colors.primaries.length],
                  child: Text(
                    _comments[index]["name"]![0].toUpperCase(), // Inisial nama
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(_comments[index]["name"]!),
                subtitle: Text(_comments[index]["comment"]!),
              ),
              // Garis pemisah
              const Divider(
                color: Colors.grey, // Warna garis pemisah
                thickness: 1, // Ketebalan garis
                indent: 72, // Jarak garis dari sisi kiri
                endIndent: 16, // Jarak garis dari sisi kanan
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateCommentPage(
                onSubmit: _addComment,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}