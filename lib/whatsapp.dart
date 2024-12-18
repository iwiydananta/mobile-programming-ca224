import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xff25D366),
        ),
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp',
          style: TextStyle(
              color: const Color.fromARGB(
                  255, 0, 202, 7)), // Mengubah warna title menjadi hijau
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search function logic
            },
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Additional options
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic for Floating Action Button (e.g., New Chat)
        },
        child: Icon(Icons.message),
        backgroundColor: Color(0xff25D366),
      ),
    );
  }
}

// Random names list for contacts
final List<String> contactNames = [
  'opa',
  'kak ros',
  'ipin',
  
];

// Function to get random colors for profile avatars
Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

// Function to get random time for each contact
String getRandomTime() {
  Random random = Random();
  int hours = random.nextInt(24);
  int minutes = random.nextInt(60);
  return '$hours:$minutes';
}

// Chats Screen
class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: index == 0
                ? AssetImage(
                    'assets/images/WhatsApp Image 2024-10-28 at 13.43.57_b4411fa1.jpg') // Image for contact 1
                : index == 1
                    ? AssetImage('assets/images/Saya2.jpg')
                    : index == 2
                        ? AssetImage('assets/images/saya.jpg')
                        : AssetImage(
                            'assets/images/default_avatar.png'), // Gambar default
            backgroundColor: (index == 0 || index == 1 || index == 2)
                ? Colors.transparent
                : getRandomColor(), // Random color for other contacts
            child: (index == 0 || index == 1 || index == 2)
                ? null
                : Text(
                    contactNames[index][0], // First letter of name
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
          title: Text(contactNames[index]),
          subtitle: Text('Pesan Terakhir Dari ${contactNames[index]}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(getRandomTime()), // Use random time for each contact
              // Notifikasi
              if (index ==
                  0) // Ganti index sesuai dengan kontak yang ingin ditambahkan notifikasi
                Container(
                  margin: EdgeInsets.only(
                      top: 4), // Jarak antara waktu dan notifikasi
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green, // Warna notifikasi
                    borderRadius:
                        BorderRadius.circular(100), // Bentuk lingkaran
                  ),
                  child: Text(
                    '2', // Jumlah notifikasi
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Status Screen'));
  }
}

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Calls Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Status: Available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to edit profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}