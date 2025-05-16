import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';  

import 'models/user_provider.dart'; // Make sure this path is correct
 import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
