import 'package:flutter/material.dart';
import 'characters_screen.dart';
import 'clans_screen.dart';
import 'tailed_beasts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = false; // Track the state of the navigation drawer

  void _toggleDrawer() {
    setState(() {
      _isExpanded = !_isExpanded; // Toggle the expanded state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naruto Universe'),
        actions: [
          IconButton(
            icon: Icon(_isExpanded ? Icons.arrow_back : Icons.menu),
            onPressed: _toggleDrawer,
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationDrawer(isExpanded: _isExpanded),
          const Expanded(
            child: Center(
              child: Text(
                'Welcome to the Naruto Universe!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold), // Make the text larger and bolder
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  final bool isExpanded;

  const NavigationDrawer({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? 200 : 60, // Change width based on expansion state
      color: Colors.blue[900],
      child: Column(
        children: [
          const DrawerHeader(
            child: Text(
              'Naruto Universe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: isExpanded ? const Text('Characters') : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CharactersScreen()),
              );
            },
          ),
          ListTile(
            title: isExpanded ? const Text('Clans') : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClansScreen()),
              );
            },
          ),
          ListTile(
            title: isExpanded ? const Text('Tailed Beasts') : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TailedBeastsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
