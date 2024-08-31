import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VicarMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vicar Message'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Add share functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Add settings functionality
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Messages from the Vicar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildMessageCard(
                    icon: FontAwesomeIcons.prayingHands,
                    title: 'The Power of Prayer',
                    excerpt:
                        'Prayer is not asking. It is a longing of the soul...',
                    onTap: () {
                      // Navigate to detailed message screen
                    },
                  ),
                  buildMessageCard(
                    icon: FontAwesomeIcons.bible,
                    title: 'Living by Faith',
                    excerpt: 'Faith is taking the first step even when...',
                    onTap: () {
                      // Navigate to detailed message screen
                    },
                  ),
                  buildMessageCard(
                    icon: FontAwesomeIcons.cross,
                    title: 'Sacrifice and Redemption',
                    excerpt: 'The greatest love is shown when people...',
                    onTap: () {
                      // Navigate to detailed message screen
                    },
                  ),
                  buildMessageCard(
                    icon: FontAwesomeIcons.handsHelping,
                    title: 'Serving the Community',
                    excerpt: 'Service to others is the rent you pay...',
                    onTap: () {
                      // Navigate to detailed message screen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF93741b),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 0, // Set the current tab to 'Home'
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/modules');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/community');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/donation');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Donation',
          ),
        ],
      ),
    );
  }

  Widget buildMessageCard({
    required IconData icon,
    required String title,
    required String excerpt,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: FaIcon(
          icon,
          size: 36,
          color: Color(0xFF93741b),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          excerpt,
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color(0xFF93741b),
        ),
        onTap: onTap,
      ),
    );
  }
}
