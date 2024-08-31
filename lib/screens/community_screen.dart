import 'package:flutter/material.dart';
import '../nav/bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommunityScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'John Doe',
      'profileIcon': FontAwesomeIcons.userCircle, // Example profile icon
      'timeAgo': '2 hours ago',
      'content': 'Just attended a wonderful service today! Feeling blessed.',
      'likes': 5,
    },
    {
      'username': 'Jane Smith',
      'profileIcon': FontAwesomeIcons.userCircle, // Example profile icon
      'timeAgo': '4 hours ago',
      'content': 'Excited about the upcoming Harvest Festival. Join us!',
      'likes': 10,
    },
    {
      'username': 'Michael Johnson',
      'profileIcon': FontAwesomeIcons.userCircle, // Example profile icon
      'timeAgo': '1 day ago',
      'content': 'Great community meeting today. Lots of new ideas shared!',
      'likes': 8,
    },
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Feed'),
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
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return buildPostCard(posts[index]);
        },
      ),
      bottomNavigationBar:
          CommonBottomNavBar(currentIndex: 1), // 1 for Community
    );
  }

  Widget buildPostCard(Map<String, dynamic> post) {
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
            Row(
              children: [
                FaIcon(
                  post['profileIcon'], // Use FontAwesome icon
                  size: 40,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['username'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      post['timeAgo'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              post['content'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.blue),
                  onPressed: () {
                    // Handle like action
                  },
                ),
                Text('${post['likes']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
