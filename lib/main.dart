import 'package:databas1/screens/dashboard_screen.dart';
import 'package:databas1/screens/login_screen.dart';
import 'package:databas1/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final loggedIn = await SharedPrefs.isLoggedIn();
  runApp(MyApp(isLoggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Prep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: isLoggedIn ? DashboardScreen() : LoginScreen(),
    );
  }
}
