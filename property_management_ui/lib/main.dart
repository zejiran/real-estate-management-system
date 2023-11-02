import 'package:flutter/material.dart';
import 'package:property_management_ui/screens/home_screen.dart';

void main() => runApp(const PropertyManagementApp());

class PropertyManagementApp extends StatelessWidget {
  const PropertyManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
