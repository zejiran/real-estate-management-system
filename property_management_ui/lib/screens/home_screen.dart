import 'package:flutter/material.dart';
import 'package:property_management_ui/screens/property_list.dart';
import 'package:property_management_ui/screens/property_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Estate Management System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyList()),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text('View Properties'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyForm()),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Property'),
            ),
          ],
        ),
      ),
    );
  }
}
