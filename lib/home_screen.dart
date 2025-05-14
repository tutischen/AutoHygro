import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Library for time formatting
import 'package:provider/provider.dart';
import 'models/user_provider.dart';

import 'field_check_screen.dart';
import 'plant_info_screen.dart';
import 'ai_chat_screen.dart';
import 'profile_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Function to get time-based greetings
  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Günyadın";
    } else if (hour < 18) {
      return "Tünaydın";
    } else {
      return "İyi Akşamlar";
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text("Autohygro"),
        backgroundColor: Colors.blueAccent, // Adjust color as needed
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Merhaba, ${Provider.of<UserProvider>(context).name}!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text("Hoşgeldin!", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.eco),
              title: Text("Tarlalarımı Kontrol Et"),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FieldCheckScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text("Yapay Zeka ile Konuş"),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AiChatScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_florist),
              title: Text("Bitkiler Hakkında Bilgi Al"),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantInfoScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Ayarlar"),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                // You can navigate to a settings screen here if you have one
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profilim"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${getGreeting()}, ${Provider.of<UserProvider>(context).name}!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              currentTime, // Displays the local time
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FieldCheckScreen()),
                );
              },
              child: Text("Tarlalarımı Kontrol Et"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AiChatScreen()),
                );
              },
              child: Text("Yapay Zeka ile Konuş"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantInfoScreen()),
                );
              },
              child: Text("Bitkiler Hakkında Bilgi Al"),
            ),
          ],
        ),
      ),
    );
  }
}
