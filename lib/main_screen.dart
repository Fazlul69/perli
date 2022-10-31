import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:perli/pages/home.dart';
import 'package:perli/pages/live_exam.dart';
import 'package:perli/pages/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
     0: GlobalKey<NavigatorState>(),
     1: GlobalKey<NavigatorState>(),
     2: GlobalKey<NavigatorState>(),
  };


  final List<Widget>_pages = [
    const Home(),
    const LiveExamPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('Preli Test'),
      ),

      body: buildNavigator(),
      bottomNavigationBar: Container(
        color: Colors.blue.shade600,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.blue.shade600,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blueAccent.shade100,
            padding: const EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            tabs:const[
              GButton(icon: Icons.home,
              text: 'Home',
              ),
              GButton(icon: Icons.favorite,
              text: 'Live Exams',
              ),
              GButton(icon: Icons.person,
              text: 'Profile',
              ),
            ],
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            ),
        ),
      ),
    );
  }

  buildNavigator() {
     return Navigator(
       key: navigatorKeys[_selectedIndex],
       onGenerateRoute: (RouteSettings settings){
         return MaterialPageRoute(builder: (_) => _pages.elementAt(_selectedIndex));
       },
     );
  }
}