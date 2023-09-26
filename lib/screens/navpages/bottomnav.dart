import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:insure/screens/navpages/categories.dart';
import 'package:insure/screens/navpages/notifications.dart';
import 'package:insure/screens/navpages/settings.dart';

import '../account/signup.dart';
import '../mainpages/homepage.dart';

class NavBar extends StatefulWidget {
  final int index;
  const NavBar({required this.index,super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List pages = const [HomePage(), Categories(), Notifications(), Settings()];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      // bottomNavigationBar: bottomNav(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: BottomNavigationBar(
            onTap: onTap,
            currentIndex: currentIndex,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: Colors.lightBlueAccent,
            unselectedItemColor: Colors.grey.withOpacity(0.8),
            items: const [
              BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "buy", icon: Icon(Icons.shop)),
              BottomNavigationBarItem(
                  label: "notification", icon: Icon(Icons.notifications)),
              BottomNavigationBarItem(
                  label: "settings", icon: Icon(Icons.settings))
            ]),
      ),
    );
  }

  Widget bottomNav() {
    return FloatingNavbar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        items: [
          FloatingNavbarItem(title: "home", icon: Icons.home),
          FloatingNavbarItem(title: "buy", icon: Icons.shop),
          FloatingNavbarItem(title: "notification", icon: Icons.notifications),
          FloatingNavbarItem(title: "settings", icon: Icons.settings),
        ],
        currentIndex: currentIndex,
        onTap: onTap);
  }
}
