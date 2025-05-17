import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'models/user_provider.dart';

import 'field_check_screen.dart';
import 'plant_info_screen.dart';
import 'ai_chat_screen.dart';
import 'profile_page.dart';
import 'services/mock_moisture_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Günaydın";
    } else if (hour < 18) {
      return "Tünaydın";
    } else {
      return "İyi Akşamlar";
    }
  }

  double _moistureLevel = 0.0;
  final MockMoistureService _moistureService = MockMoistureService();

  @override
  void initState() {
    super.initState();
    _fetchMoisture();
  }

  void _fetchMoisture() async {
    double level = await _moistureService.getMoistureLevel();
    setState(() {
      _moistureLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text("Autohygro"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        // Optional: Add your drawer content here
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "Menü",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
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
              currentTime,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Moisture Level Display
            Text(
              "Toprak Nem Seviyesi:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 6),
            Text(
              "${_moistureLevel.toStringAsFixed(2)}%",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _moistureLevel < 30 ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchMoisture,
              child: Text("Yenile"),
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
