import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_ui/screens/property_list.dart';
import 'package:property_management_ui/screens/property_form.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            DotLottieLoader.fromAsset(
              'assets/animations/house_animation.lottie',
              frameBuilder: (BuildContext context, DotLottie? dotLottie) {
                if (dotLottie != null) {
                  return SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.memory(
                      dotLottie.animations.values.first,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Real Estate Management System.\nManage your properties with ease!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyList()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              icon: const Icon(Icons.explore),
              label: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Explore Properties',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyForm()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              icon: const Icon(Icons.add),
              label: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Add a New Property',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
