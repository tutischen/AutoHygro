import 'package:flutter/material.dart';

class FieldCheckScreen extends StatelessWidget {
  // Temporary dummy moisture values
  final double moistureLeft = 45.0;
  final double moistureRight = 60.0;

  String getMoistureStatus(double value) {
    if (value < 30) return "Kuru";
    if (value < 60) return "Nemli";
    return "Islak";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarlalarımı Kontrol Et"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Toprak Nem Durumu",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Left sensor
            Card(
              child: ListTile(
                leading: Icon(Icons.opacity),
                title: Text("Sol Sensör"),
                subtitle: Text("${moistureLeft.toStringAsFixed(1)}% - ${getMoistureStatus(moistureLeft)}"),
              ),
            ),

            // Right sensor
            Card(
              child: ListTile(
                leading: Icon(Icons.opacity_outlined),
                title: Text("Sağ Sensör"),
                subtitle: Text("${moistureRight.toStringAsFixed(1)}% - ${getMoistureStatus(moistureRight)}"),
              ),
            ),

            SizedBox(height: 30),

            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.water),
                label: Text("Manuel Sulama (Test)"),
                onPressed: () {
                  // This will trigger watering later
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Sulama başlatıldı! (Simülasyon)")),
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
