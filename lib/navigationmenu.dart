import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sculptgen/features/authentication/screens/home.dart';
import 'package:sculptgen/features/settings/screens/profile.dart';
import 'package:sculptgen/features/tools/screens/tools.dart';

class NavigationMenuScreen extends StatefulWidget {
  const NavigationMenuScreen({super.key});

  @override
  State<NavigationMenuScreen> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenuScreen> {

  int _pageIndex = 0;
  final List <Widget> _tabList = [
    const HomeScreen(),
    const ToolScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  currentIndex: _pageIndex,
                  backgroundColor: Colors.black,
                  onTap: (int index){
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Iconsax.home) , label: "Home"),
                    BottomNavigationBarItem(icon: Icon(Iconsax.personalcard) , label: "Account"),
                    BottomNavigationBarItem(icon: Icon(Iconsax.people) , label: "Setting"),
              
                  ]
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}