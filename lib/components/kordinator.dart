import 'package:flutter/material.dart';
import 'package:plant_app/screens/home.dart';
import 'package:plant_app/screens/my_page.dart';

class Kordinator extends StatefulWidget {
  const Kordinator({Key? key}) : super(key: key);

  @override
  State<Kordinator> createState() => _KordinatorState();
}

class _KordinatorState extends State<Kordinator> {
  List pages = [const Home(), const MyPage()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: 'About', icon: Icon(Icons.note_alt_outlined)),
        ],
      ),
    );
  }
}
