import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: MaterialApp(
        title: 'Naruto App',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue[900],
          scaffoldBackgroundColor: Colors.blue[800],
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
