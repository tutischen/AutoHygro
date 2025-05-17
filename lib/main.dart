import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';  // Add this import
import 'home_screen.dart';
import 'models/user_provider.dart';
import 'services/mock_moisture_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();        // Required for async in main
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // From your generated firebase_options.dart
  );

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
        primaryColor: Color(0xFF060663),
        fontFamily: 'Ubuntu',
      ),
      home: HomeScreen(),
    );
  }
}