import 'package:flutter/material.dart';
import 'landing_screen.dart';
import 'modules_screen.dart';
import 'screens/vicar_message_screen.dart';
import 'screens/community_screen.dart';
import 'screens/donation_screen.dart';

void main() {
  runApp(SanctifyApp());
}

class SanctifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanctify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/modules': (context) => ModulesScreen(),
        '/vicar_message': (context) => VicarMessageScreen(),
        '/community': (context) => CommunityScreen(),
        '/donation': (context) => DonationScreen(),
      },
    );
  }
}
