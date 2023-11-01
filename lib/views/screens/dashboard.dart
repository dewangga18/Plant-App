import 'package:flutter/material.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/screens/home.dart';
import 'package:plant_app/views/screens/saved.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Plant> savedData = [];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (_) {
        List pages = [
          const HomeScreen(),
          const SavedScreen(),
        ];

        return pages[currentIndex];
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.green.shade600,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Saved',
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
