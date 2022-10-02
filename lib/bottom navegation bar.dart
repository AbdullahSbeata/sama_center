import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sama/home.dart';
import 'package:sama/sama culture screen.dart';
import 'package:sama/sama media screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 2;
  List<Widget> Screens = [
    SamaCulture(),
    SamaMedia(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.green[600],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Tajawal'),
        selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Tajawal'),
        onTap: (index) {
           setState(() {
              currentIndex = index;
           });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: "سما للثقافة والفنون",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.media_bluetooth_off),
            label: "سما ميديا",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "الرئيسية",
          ),
        ],
      ),
      body: Screens[currentIndex],
    );
  }
}
