import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'models/user_provider.dart'; // Make sure this path is correct

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autohygro',
      theme: ThemeData(
        primaryColor: Color(0xFF060663), // Your custom color
        fontFamily: 'Ubuntu',            // Your font
      ),
      home: HomeScreen(),
    );
  }
}
