import 'package:flutter/material.dart';

class PlantInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bitkiler Hakkında Bilgi Al"),
      ),
      body: Center(
        child: Text("Burası Bitkiler Bilgi sayfası!"),
      ),
    );
  }
}
