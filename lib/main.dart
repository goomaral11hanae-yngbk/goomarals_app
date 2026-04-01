import 'package:flutter/material.dart';

import 'screens/LoginScreen.dart';
import 'screens/ShopShell.dart';

void main() {
  runApp(const JewelleryApp());
}

class JewelleryApp extends StatelessWidget {
  const JewelleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jewellery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const ShopShell(),
      },
    );
  }
}
