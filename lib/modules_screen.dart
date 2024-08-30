import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfefaf5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'BMTC',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.info_outline, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Announcements Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Announcements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFfff5e3), Color(0xFFffe4c2)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Verse",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'But know this, that in the last days perilous time...',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('Read Now'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(width: 10),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FaIcon(
                            FontAwesomeIcons
                                .prayingHands, // Font Awesome praying hands icon
                            size: 96,
                            color: Colors
                                .deepOrangeAccent, // Set the color you want
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Menu Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFfdf4d3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          modules[index]['icon'],
                          size: 32,
                          color: Colors.black87,
                        ),
                        SizedBox(height: 10),
                        Text(
                          modules[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Upcoming Events Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Upcoming events',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 250, // Set a fixed height
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: events.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Transform.translate(
                            offset: Offset(-20, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 5,
                              color: Color(0xFFfff5e3),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.event,
                                      size: 48,
                                      color: Colors.black87,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      events[index]['title'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      events[index]['date'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      events[index]['time'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
        unselectedItemColor: Colors.white,
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

  final List<Map<String, dynamic>> modules = [
    {
      'name': 'Vicar Message',
      'icon': Icons.message,
    },
    {
      'name': 'Bishop & Vicar',
      'icon': Icons.person,
    },
    {
      'name': 'Worship',
      'icon': Icons.favorite,
    },
    {
      'name': 'Organization',
      'icon': Icons.group,
    },
    {
      'name': 'Publication',
      'icon': Icons.book,
    },
    {
      'name': 'Parish Directory',
      'icon': Icons.contact_phone,
    },
    {
      'name': 'Gallery',
      'icon': Icons.photo_album,
    },
    {
      'name': 'Office Bearers',
      'icon': Icons.business,
    },
    {
      'name': 'Announcements',
      'icon': Icons.announcement,
    },
  ];

  final List<Map<String, dynamic>> events = [
    {
      'title': 'Harvest Festival & Community Celebration',
      'date': 'Sunday, October 15, 2024',
      'time': '10:00 AM - 3:00 PM',
    },
    {
      'title': 'Thanksgiving Dinner & Prayer Service',
      'date': 'Sunday, November 25, 2024',
      'time': '5:00 PM - 9:00 PM',
    },
  ];
}

void main() {
  runApp(MaterialApp(
    home: ModulesScreen(),
  ));
}
