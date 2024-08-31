import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../nav/bottom_navbar.dart';

class BishopAndVicarScreen extends StatelessWidget {
  final List<Map<String, String>> clergy = [
    {
      'name': 'Bishop Alphonse mathew',
      'role': 'Bishop',
      'phone': '+1 234 567 8901',
    },
    {
      'name': 'Vicar Daniel James',
      'role': 'Vicar',
      'phone': '+1 234 567 8902',
    },
    {
      'name': 'Vicar Paul Andersonr',
      'role': 'Vicar',
      'phone': '+1 234 567 8903',
    },
    // Add more bishops and vicars here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bishops & Vicars'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: clergy.length,
        itemBuilder: (context, index) {
          return buildClergyCard(clergy[index]);
        },
      ),
      bottomNavigationBar: CommonBottomNavBar(
          currentIndex: 0), // Adjust the index as per the navigation
    );
  }

  Widget buildClergyCard(Map<String, String> clergyMember) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clergyMember['name']!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              clergyMember['role']!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  clergyMember['phone']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.call, color: Colors.green),
                  onPressed: () {
                    _makePhoneCall(clergyMember['phone']!);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
