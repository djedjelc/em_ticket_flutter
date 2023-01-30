import 'package:event_mandela/qr_scanner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
        )
      ),
      home: QRScanner(),
      debugShowCheckedModeBanner: false,
      title: 'Event Mandela',
    );
  }
}